# == Schema Information
#
# Table name: donations
#
#  id                    :integer          not null, primary key
#  donor_id              :integer
#  donor_type            :string(255)
#  amount                :decimal(, )
#  matched               :boolean
#  matching_organization :string(255)
#  match_amount          :decimal(, )
#  information           :text
#  created_at            :datetime
#  updated_at            :datetime
#

class Donation < ActiveRecord::Base
	belongs_to :donor
end
