# == Schema Information
#
# Table name: applications
#
#  id               :integer          not null, primary key
#  school_id        :integer
#  applicant_id     :integer
#  requested_amount :decimal(, )
#  created_at       :datetime
#  updated_at       :datetime
#

class Application < ActiveRecord::Base
	belongs_to :school
	has_many :applicants
	validates_presence_of :school
end
