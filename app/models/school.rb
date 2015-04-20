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
	# constants
	GRADE_LEVELS = ["Pre-K","Kindergarten","1","2","3","4","5","6","7","8","9","10","11"]

	# dependencies
	include ActionView::Helpers::NumberHelper

	# relationships
	has_many :applications
	has_many :applicants, through: :applications
	has_many :donations
	has_many :donors, through: :donations
	has_many :disbursements
	has_many :school_admins

	def formatted_tuition
		number_to_currency(self.tuition, :precision => 0)
	end
end
