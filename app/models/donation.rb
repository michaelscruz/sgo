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
	has_many :fund_designations

	accepts_nested_attributes_for :donor
	accepts_nested_attributes_for :fund_designations, allow_destroy: true

	def total_for_general_fund
		total_designated = 0
		self.fund_designations.each do |f|
			total_designated += f.percentage
		end
		if total_designated <= 100
			self.general_fund = ((100 - total_designated) / 100) * self.amount
		else
			raise PercentageOverageException, "Fund designation percentages must not total more than 100."
		end
	end

	class PercentageOverageException < RuntimeError
	end
end
