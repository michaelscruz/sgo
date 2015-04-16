# == Schema Information
#
# Table name: application_statuses
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  status_code    :string(255)
#  application_id :integer
#  created_at     :datetime
#  updated_at     :datetime
#

class ApplicationStatus < ActiveRecord::Base
	belongs_to :user
	belongs_to :application
end
