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
#  stripe_customer_token :string(255)
#  non_user_donor_id     :integer
#

class Donation < ActiveRecord::Base
	belongs_to :non_user_donor
	has_many :fund_designations
	belongs_to :donor

	attr_accessor :stripe_card_token

	accepts_nested_attributes_for :donor
	accepts_nested_attributes_for :non_user_donor
	accepts_nested_attributes_for :fund_designations, allow_destroy: true

	def total_for_general_fund
		total_designated = 0
		self.fund_designations.each do |f|
			total_designated += f.percentage
		end
		if total_designated <= 100
			self.general_fund = ((100 - total_designated) / 100) * self.amount
		else
			raise "Fund designation percentages must not total more than 100."
		end
	end

	def save_with_payment
		if valid?
			customer = Stripe::Customer.create(description: "Donation of #{amount} from #{non_user_donor.full_name}.", 
				card: stripe_card_token)
			charge_amount = (amount * 100).to_i
			charge = Stripe::Charge.create(customer: customer.id, amount: charge_amount, currency: 'usd', 
				description: "Donation of #{amount} from #{non_user_donor.full_name}.")
			self.stripe_customer_token = customer.id
			save!
		end
	rescue Stripe::InvalidRequestError => e
		logger.error "Stripe error while creating customer: #{e.message}"
		errors.add :base, "There was a problem with your credit card."
		false
	end
end
