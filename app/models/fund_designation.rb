# == Schema Information
#
# Table name: fund_designations
#
#  id          :integer          not null, primary key
#  percentage  :decimal(, )
#  school_id   :integer
#  donation_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class FundDesignation < ActiveRecord::Base
  belongs_to :school
  belongs_to :donation
end
