# == Schema Information
#
# Table name: application_statuses
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  status_code    :string(255)
#  application_id :integer
#  notes          :text
#  created_at     :datetime
#  updated_at     :datetime
#

class ApplicationStatus < ActiveRecord::Base
	# constants
	PENDING_FAMILY = 1
	PENDING_SCHOOL = 2
	PENDING_SGO = 3
	PENDING_DOR = 4
	APPROVED = 5

	# associations
	belongs_to :user
	belongs_to :application

	# validations
	validates :user, :presence => true
	validates_inclusion_of :status_code, :in => [1, 2, 3, 4, 5]

	# custom methods
	def display_status
		case self.status_code
			when ApplicationStatus::PENDING_FAMILY
				"Pending Family"
			when ApplicationStatus::PENDING_SCHOOL
				"Pending School"
			when ApplicationStatus::PENDING_SGO
				"Pending SGO"
			when ApplicationStatus::PENDING_DOR
				"Pending DOR"
			when ApplicationStatus::APPROVED
				"Approved"
		end
	end
end
