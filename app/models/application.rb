# == Schema Information
#
# Table name: applications
#
#  id                    :integer          not null, primary key
#  school_id             :integer
#  applicant_id          :integer
#  requested_amount      :decimal(, )
#  created_at            :datetime
#  updated_at            :datetime
#  parent_first_name     :string(255)
#  parent_last_name      :string(255)
#  parent_middle_initial :string(255)
#  email                 :string(255)
#  confirm_email         :string(255)
#  phone                 :string(255)
#  address               :string(255)
#  apartment_number      :string(255)
#  city                  :string(255)
#  state                 :string(255)
#  zip                   :string(255)
#

class Application < ActiveRecord::Base
	# static values
	VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	# relationships
	belongs_to :school
	has_many :applicants
	has_many :application_files
	accepts_nested_attributes_for :applicants
	accepts_nested_attributes_for :application_files

	# validations
	validates :school, :presence => true
	validates :requested_amount, :presence => true
	validates :parent_first_name, :presence => true
	validates :parent_last_name, :presence => true
	validates :email, :format => {:with => VALID_EMAIL}, :presence => true
	validates :confirm_email, :format => {:with => VALID_EMAIL}, :presence => true
	validate :emails_must_match

	# callbacks
	after_create :set_initial_status

	# custom methods
	def emails_must_match
		if self.email != self.confirm_email
			errors.add(:email, " must match confirmation")
		end
	end

	def set_initial_status
	end
end
