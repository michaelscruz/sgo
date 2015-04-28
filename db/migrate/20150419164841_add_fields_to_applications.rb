class AddFieldsToApplications < ActiveRecord::Migration
  def change
  	add_column :applications, :parent_first_name, :string
  	add_column :applications, :parent_last_name, :string
  	add_column :applications, :parent_middle_initial, :string
  	add_column :applications, :email, :string
  	add_column :applications, :confirm_email, :string
  	add_column :applications, :phone, :string
  	add_column :applications, :address, :string
  	add_column :applications, :apartment_number, :string
  	add_column :applications, :city, :string
  	add_column :applications, :state, :string
  	add_column :applications, :zip, :string
  end
end
