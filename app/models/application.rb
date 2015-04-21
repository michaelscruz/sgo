# == Schema Information
#
# Table name: applications
#
#  id                                 :integer          not null, primary key
#  school_id                          :integer
#  applicant_id                       :integer
#  requested_amount                   :decimal(, )
#  created_at                         :datetime
#  updated_at                         :datetime
#  parent_first_name                  :string(255)
#  parent_last_name                   :string(255)
#  parent_middle_initial              :string(255)
#  email                              :string(255)
#  confirm_email                      :string(255)
#  phone                              :string(255)
#  address                            :string(255)
#  apartment_number                   :string(255)
#  city                               :string(255)
#  state                              :string(255)
#  zip                                :string(255)
#  household_id                       :integer
#  number_in_household                :integer
#  household_income                   :decimal(, )
#  school_official_first_name         :string(255)
#  school_official_last_name          :string(255)
#  school_official_email              :string(255)
#  school_official_confirm_email      :string(255)
#  school_official_phone              :string(255)
#  school_official_phone_ext          :string(255)
#  information_verified               :boolean
#  third_party_income_verified        :boolean
#  choice_scholarship_income_verified :boolean
#  document_income_verified           :boolean
#  tuition_for_application            :decimal(, )
#  choice_scholarship_amount          :decimal(, )
#  choice_scholarship_explanation     :text
#

class Application < ActiveRecord::Base
	# static values
	VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	attr_accessor :family_application, :school_application

	# dependencies
	include ActionView::Helpers::NumberHelper

	# relationships
	belongs_to :school
	belongs_to :household
	has_many :applicants
	has_many :application_files
	has_many :application_statuses
	accepts_nested_attributes_for :applicants
	accepts_nested_attributes_for :application_files

	# validations
	validates :household, :presence => true, :if => :family_application
	validates :school, :presence => true, :if => :family_application
	validates :requested_amount, :presence => true, :if => :family_application
	validates :parent_first_name, :presence => true, :if => :family_application
	validates :parent_last_name, :presence => true, :if => :family_application
	validates :email, :format => {:with => VALID_EMAIL}, :presence => true, :if => :family_application
	validates :confirm_email, :format => {:with => VALID_EMAIL}, :presence => true, :if => :family_application
	validate :emails_must_match, :if => :family_application
	validates :household_income, :presence => true, :if => :family_application
	validates :number_in_household, :presence => true, :if => :family_application

	validates :school_official_first_name, :presence => true, :if => :school_application
	validates :school_official_last_name, :presence => true, :if => :school_application
	validates :school_official_email, :format => {:with => VALID_EMAIL}, :presence => true, :if => :school_application
	validates :school_official_confirm_email, :format => {:with => VALID_EMAIL}, :presence => true, :if => :school_application
	validates :information_verified, :presence => true, :if => :school_application
	validates :tuition_for_application, :presence => true, :if => :school_application
	validates :choice_scholarship_amount, :presence => true, :if => :school_application

	# callbacks
	after_create :set_initial_status!

	# custom methods
	def emails_must_match
		if self.email != self.confirm_email
			errors.add(:email, " must match confirmation")
		end
	end

	def set_initial_status!
		self.application_statuses.create(:status_code => ApplicationStatus::PENDING_SCHOOL, :user => self.household, :notes => "Auto generated on application submission.")
	end

	def school_confirm!(user)
		self.application_statuses.create(:status_code => ApplicationStatus::PENDING_SGO, :user => user, :notes => "Auto generated on school confirmation.")
	end

	def current_status
		self.application_statuses.last
	end

	def display_id
		display_id = self.id.to_s
		if self.id < 10000
			loop do 
			  display_id = display_id.prepend("0")
			  break if display_id.length == 5
			end 
		end
		display_id
	end

	def full_name
		[self.parent_first_name, self.parent_last_name].join(' ')
	end

	def full_address
		[self.address, self.apartment_number, self.city, self.state, self.zip].reject!{|v| v.empty?}.join(', ')
	end

	def formatted_requested_amount
		number_to_currency(self.requested_amount, :precision => 0)
	end

	def formatted_household_income
		number_to_currency(self.household_income, :precision => 0)
	end
end
