# == Schema Information
#
# Table name: schools
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  tuition    :decimal(, )
#  created_at :datetime
#  updated_at :datetime
#

class School < ActiveRecord::Base
	has_many :applications
	has_many :applicants, through: :applications
	has_many :donations
	has_many :donors, through: :donations
	has_many :disbursements
	has_many :school_admins
end
