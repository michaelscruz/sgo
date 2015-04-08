class Applicant < ActiveRecord::Base
	has_many :applications
	belongs_to :household
end
