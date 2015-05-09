# == Schema Information
#
# Table name: application_statuses
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  status_code    :integer
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
	# validates :user, :presence => true
	validates_inclusion_of :status_code, :in => [1, 2, 3, 4, 5]

	# callbacks
	after_create :send_status_update

	# custom methods
	def display_status
		case self.status_code
			when ApplicationStatus::PENDING_FAMILY
				"Pending Family"
			when ApplicationStatus::PENDING_SCHOOL
				"Pending School Review"
			when ApplicationStatus::PENDING_SGO
				"Pending SGO Review"
			when ApplicationStatus::PENDING_DOR
				"Pending DOR Review"
			when ApplicationStatus::APPROVED
				"Approved"
		end
	end

	def send_status_update
		if self.pending_school?
			ApplicationStatusMailer.parent_application_confirmation(self.application).deliver
			ApplicationStatusMailer.school_application_notification(self.application).deliver
		elsif self.pending_sgo?
			ApplicationStatusMailer.sgo_school_notification(self.application).deliver
		elsif self.approved?
			ApplicationStatusMailer.school_sgo_notification(self.application).deliver
		end
	end

	def pending_family?
		self.status_code == PENDING_FAMILY
	end

	def pending_school?
		self.status_code == PENDING_SCHOOL
	end

	def pending_sgo?
		self.status_code == PENDING_SGO
	end

	def pending_dor?
		self.status_code == PENDING_DOR
	end

	def approved?
		self.status_code == APPROVED
	end
end
