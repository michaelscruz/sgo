# == Schema Information
#
# Table name: applicants
#
#  id                               :integer          not null, primary key
#  child_id                         :integer
#  application_id                   :integer
#  grade                            :string(255)
#  address                          :string(255)
#  city                             :string(255)
#  state                            :string(255)
#  zip                              :string(255)
#  created_at                       :datetime
#  updated_at                       :datetime
#  apartment_number                 :string(255)
#  public_school                    :boolean
#  public_school_grade              :string(255)
#  tax_credit_scholarship           :boolean
#  tax_credit_scholarship_grade     :string(255)
#  relationship_to_applicant        :string(255)
#  reside_with_relation             :boolean
#  reside_with_relation_explanation :string(255)
#

class Applicant < ActiveRecord::Base
	# constants
	RELATIONSHIPS = ["Mother", "Father", "Legal Guardian"]

	# associations
	belongs_to :application
	belongs_to :child
	has_many :application_files

	# validations
	validate :child_or_full_name

	# custom methods
	def child_or_full_name
		if self.child_id.blank? && (self.first_name.blank? || self.last_name.blank?)
			errors.add(:first_and_last_name, " cannot be blank")
		end
	end

	def full_name
		if self.child
			self.child.full_name
		else
			[self.first_name, self.last_name].join(' ')
		end
	end

	def full_address
		[self.address, self.apartment_number, self.city, self.state, self.zip].reject!{|v| v.empty?}.join(', ')
	end
end
