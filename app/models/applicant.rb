# == Schema Information
#
# Table name: applicants
#
#  id                         :integer          not null, primary key
#  first_name                 :string(255)
#  last_name                  :string(255)
#  middle_init                :string(255)
#  address                    :text
#  city                       :string(255)
#  apt                        :string(255)
#  state                      :string(255)
#  zip                        :string(255)
#  birthdate                  :date
#  grade                      :integer
#  attended_public_or_charter :boolean
#  created_at                 :datetime
#  updated_at                 :datetime
#

class Applicant < ActiveRecord::Base
	has_many :applications
	belongs_to :household
end
