class School < ActiveRecord::Base
	has_many :applications
	has_many :applicants, through: :applications
	has_many :donations
	has_many :donors, through: :donations
	has_many :disbursements
end
