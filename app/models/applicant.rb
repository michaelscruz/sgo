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
	validates :child, :presence => true
end
