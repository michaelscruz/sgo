# == Schema Information
#
# Table name: non_user_donors
#
#  id                    :integer          not null, primary key
#  donor_type            :string(255)
#  first_name            :string(255)
#  last_name             :string(255)
#  middle_initial        :string(255)
#  ssn                   :string(255)
#  apt                   :string(255)
#  city                  :string(255)
#  zip                   :string(255)
#  state                 :string(255)
#  email                 :string(255)
#  address               :string(255)
#  created_at            :datetime
#  updated_at            :datetime
#  stripe_customer_token :string(255)
#

class NonUserDonor < ActiveRecord::Base
	has_many :donors
	has_many :donations

  def copy_nu_donor nu_donor
  	self.donor_type = nu_donor.donor_type unless nu_donor.donor_type.blank?
  	self.first_name = nu_donor.first_name unless nu_donor.first_name.blank?
  	self.last_name = nu_donor.last_name unless nu_donor.last_name.blank?
  	self.middle_initial = nu_donor.middle_initial unless nu_donor.middle_initial.blank?
  	self.ssn = nu_donor.ssn unless nu_donor.ssn.blank?
  	self.city = nu_donor.city unless nu_donor.city.blank?
  	self.zip = nu_donor.zip unless nu_donor.zip.blank?
  	self.state = nu_donor.state unless nu_donor.state.blank?
  	self.email = nu_donor.email unless nu_donor.email.blank?
  	self.address = nu_donor.address unless nu_donor.address.blank?
  	self.apt = nu_donor.apt unless nu_donor.apt.blank?
  end

private

end
