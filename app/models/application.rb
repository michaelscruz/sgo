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
	belongs_to :applicant
	belongs_to :child
end
