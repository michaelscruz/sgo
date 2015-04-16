# == Schema Information
#
# Table name: applicants
#
#  id             :integer          not null, primary key
#  child_id       :integer
#  application_id :integer
#  grade          :string(255)
#  address        :string(255)
#  city           :string(255)
#  state          :string(255)
#  zip            :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

class Applicant < ActiveRecord::Base
	belongs_to :application
	belongs_to :child
end
