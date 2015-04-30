# == Schema Information
#
# Table name: donations
#
#  id                    :integer          not null, primary key
#  donor_type            :string(255)
#  amount                :decimal(, )
#  matched               :boolean
#  matching_organization :string(255)
#  match_amount          :decimal(, )
#  information           :text
#  created_at            :datetime
#  updated_at            :datetime
#  donor_id              :integer
#  general_fund          :decimal(, )
#  non_user_donor_id     :integer
#  donation_type         :string(255)
#  draft_date            :integer
#  first_name            :string(255)
#  last_name             :string(255)
#  address               :text
#  city                  :string(255)
#  state                 :string(255)
#  zip                   :string(255)
#  ssn                   :string(255)
#  middle_initial        :string(255)
#  apt                   :string(255)
#  email                 :string(255)
#  stripe_customer_token :string(255)
#

class Donation < ActiveRecord::Base
	include ActiveModel::Validations

	belongs_to :non_user_donor
	has_many :fund_designations
	belongs_to :donor

	validates_with SsnValidator

	validates_presence_of :donor_type, :first_name, :last_name, :ssn, :address, :city, :state, :zip
	validates :amount, presence: true, numericality: { greater_than: 0 }

	attr_accessor :stripe_card_token

	accepts_nested_attributes_for :donor
	accepts_nested_attributes_for :non_user_donor
	accepts_nested_attributes_for :fund_designations, allow_destroy: true

	before_save :set_donor_token

	# Class methods

	def self.todays_monthly_drafts
		Donation.where(:donation_type => "Monthly", :draft_date => Date.today.mday)
	end

    # Display methods

	def full_name
		[self.first_name, self.last_name].join(' ')
	end

	def display_ssn
		"XXX-XX-#{self.ssn.last(4)}"
	end

	def display_ssn_for_edit
		if ssn.to_i.to_s == ssn
		  self.ssn.insert(5, '-').insert(3, '-')
		end
	end

    def matched?
    	self.matched ? "Yes" : "No"
    end

    def display_donation_date
    	date = self.created_at.to_date
    	"#{date.month}/#{date.mday}/#{date.year}"
    end

    def display_request_date
    	"A Day In The Future..."
    end

    # Setter methods

    def set_fields donor
    	self.first_name = donor.first_name
    	self.last_name = donor.last_name
    	self.middle_initial = donor.middle_initial
    	self.email = donor.email
    	self.address = donor.address
    	self.apt = donor.apt
    	self.city = donor.city
    	self.state = donor.state
    	self.zip = donor.zip
    	self.ssn = donor.ssn
    end

	def set_donor_fields
		self.donor.first_name = self.first_name
		self.donor.last_name = self.last_name
		self.donor.address = self.address
		self.donor.apt = self.apt
		self.donor.city = self.city
		self.donor.state = self.state
		self.donor.zip = self.zip
		self.donor.ssn = self.ssn
		self.donor.middle_initial = self.middle_initial
		self.email = self.donor.email
		self.stripe_customer_token = self.donor.stripe_customer_token
    end

	def total_for_general_fund
		total_designated = 0
		self.fund_designations.each do |f|
			unless f.percentage
				raise "Must enter a percentage for each school."
			end
			total_designated += f.percentage
		end
		if total_designated <= 100
			self.general_fund = ((100 - total_designated) / 100) * self.amount
		else
			raise "Fund designation percentages must not total more than 100."
		end
	end

    # Stripe charge methods

	def save_with_payment
		if valid?
			if self.stripe_customer_token.blank?
				customer = Stripe::Customer.create(description: "Donation of #{amount} from #{self.full_name}.", 
					card: stripe_card_token)
				self.stripe_customer_token = customer.id
			end
			create_charge  "Donation of #{amount} from #{self.full_name}."
			save!
		end
	rescue Stripe::InvalidRequestError => e
		logger.error "Stripe error while creating customer: #{e.message}"
		errors.add :base, "There was a problem with your credit card."
		false
	end

	def draft_recurring_donation
		create_charge "Monthly donation from #{self.full_name} in the amount of $#{amount} for #{Date.today.month}/#{Date.today.year}."
	end

private
	
	def create_charge description
		charge_amount = (self.amount * 100).to_i
		charge = Stripe::Charge.create(customer: self.stripe_customer_token, amount: charge_amount, currency: 'usd',
			description: description)
	end

	def set_donor_token
		unless self.donor.nil?
			self.donor.stripe_customer_token = self.stripe_customer_token
			self.donor.save!
		end
	end
end
