class AddFieldsToDonations < ActiveRecord::Migration
  def change
    add_column :donations, :first_name, :string
    add_column :donations, :last_name, :string
    add_column :donations, :address, :text
    add_column :donations, :city, :string
    add_column :donations, :state, :string
    add_column :donations, :zip, :string
    add_column :donations, :ssn, :string
    add_column :donations, :middle_initial, :string
    add_column :donations, :apt, :string
    add_column :donations, :email, :string
  end
end
