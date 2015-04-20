class AddFieldsToApplicants < ActiveRecord::Migration
  def change
    add_column :applicants, :apartment_number, :string
    add_column :applicants, :public_school, :boolean
    add_column :applicants, :public_school_grade, :string
    add_column :applicants, :tax_credit_scholarship, :boolean
    add_column :applicants, :tax_credit_scholarship_grade, :string
    add_column :applicants, :relationship_to_applicant, :string
    add_column :applicants, :reside_with_relation, :boolean
    add_column :applicants, :reside_with_relation_explanation, :string
  end
end
