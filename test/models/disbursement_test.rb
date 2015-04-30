# == Schema Information
#
# Table name: disbursements
#
#  id            :integer          not null, primary key
#  disburse_date :date
#  amount        :decimal(, )
#  type          :string(255)
#  awards        :integer
#  status        :string(255)
#  school_id     :integer
#  created_at    :datetime
#  updated_at    :datetime
#

require 'test_helper'

class DisbursementTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
