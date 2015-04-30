# == Schema Information
#
# Table name: non_user_donors
#
#  id                    :integer          not null, primary key
#  donor_type            :string(255)
#  first_name            :string(255)
#  last_name             :string(255)
#  middle_initial        :string(255)
#  ssn                   :string(255)
#  apt                   :string(255)
#  city                  :string(255)
#  zip                   :string(255)
#  state                 :string(255)
#  email                 :string(255)
#  address               :string(255)
#  created_at            :datetime
#  updated_at            :datetime
#  stripe_customer_token :string(255)
#

require 'test_helper'

class NonUserDonorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
