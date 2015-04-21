class AddSchoolFieldsToApplications < ActiveRecord::Migration
  def change
  	add_column :applications, :school_official_first_name, :string
  	add_column :applications, :school_official_last_name, :string
  	add_column :applications, :school_official_email, :string
  	add_column :applications, :school_official_confirm_email, :string
  	add_column :applications, :school_official_phone, :string
  	add_column :applications, :school_official_phone_ext, :string
  	add_column :applications, :information_verified, :boolean
  	add_column :applications, :third_party_income_verified, :boolean
  	add_column :applications, :choice_scholarship_income_verified, :boolean
  	add_column :applications, :document_income_verified, :boolean
  	add_column :applications, :tuition_for_application, :decimal
  	add_column :applications, :choice_scholarship_amount, :decimal
  	add_column :applications, :choice_scholarship_explanation, :text
  end
end
