class AddDonorFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zip, :string
    add_column :users, :ssn, :string
    add_column :users, :apt, :string
  end
end
