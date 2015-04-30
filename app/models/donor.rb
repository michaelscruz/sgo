# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime
#  updated_at             :datetime
#  first_name             :string(255)
#  last_name              :string(255)
#  address                :text
#  phone                  :string(255)
#  relation               :string(255)
#  type                   :string(255)
#  school_id              :integer
#  terms_of_use           :boolean
#  non_user_donor_id      :integer
#  donor_type             :string(255)
#  city                   :string(255)
#  state                  :string(255)
#  zip                    :string(255)
#  ssn                    :string(255)
#  apt                    :string(255)
#  middle_initial         :string(255)
#  stripe_customer_token  :string(255)
#

class Donor < User
	include ActiveModel::Validations

	belongs_to :non_user_donor
	has_many :donations

	validates_with SsnValidator

	# Setter methods

	def set_fields_from_donation donation
		self.address = donation.address
		self.city = donation.city
		self.apt = donation.apt
		self.state = donation.state
		self.zip = donation.zip
		self.ssn = donation.ssn
		self.donor_type = donation.donor_type
		self.first_name = donation.first_name
		self.last_name = donation.last_name
		self.middle_initial = donation.middle_initial
	end
end
