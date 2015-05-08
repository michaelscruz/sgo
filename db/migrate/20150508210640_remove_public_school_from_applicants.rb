class RemovePublicSchoolFromApplicants < ActiveRecord::Migration
  def change
  	remove_column :applicants, :public_school, :boolean
  	remove_column :applicants, :public_school_grade, :string
  	remove_column :applicants, :tax_credit_scholarship_grade, :string
  	remove_column :applications, :requested_amount, :decimal
  end
end
