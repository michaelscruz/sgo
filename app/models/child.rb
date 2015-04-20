# == Schema Information
#
# Table name: children
#
#  id           :integer          not null, primary key
#  household_id :integer
#  dob          :date
#  first_name   :string(255)
#  last_name    :string(255)
#  school_id    :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class Child < ActiveRecord::Base
	# associations
	belongs_to :household
	has_many :applicants

	# validations
	validates :first_name, :presence => true
	validates :last_name, :presence => true
	validates :dob, :presence => true

	# custom methods
	def age
		(Time.now.to_s(:number).to_i - self.dob.to_time.to_s(:number).to_i)/10e9.to_i
	end

	def full_name
		[self.first_name, self.last_name].join(' ')
	end

	def has_applications?
		!self.applicants.empty?
	end

	def most_recent_application
		self.applicants.last.application
	end
end
