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

class Disbursement < ActiveRecord::Base
	belongs_to :school

	# Display methods

	def display_date
		"#{disburse_date.month}/#{disburse_date.mday}/#{disburse_date.year}"
	end
end
