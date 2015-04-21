class AddSgoFieldsToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :scholarship_approved, :boolean
    add_column :applications, :approved_by_initials, :string
    add_column :applications, :approved_date, :date
  end
end
