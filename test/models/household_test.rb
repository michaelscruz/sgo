# == Schema Information
#
# Table name: households
#
#  id                  :integer          not null, primary key
#  income              :decimal(, )
#  number_in_household :integer
#  address             :string(255)
#  address_two         :string(255)
#  city                :string(255)
#  state               :string(255)
#  zip                 :string(255)
#  household_user_id   :integer
#  created_at          :datetime
#  updated_at          :datetime
#

require 'test_helper'

class HouseholdTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
