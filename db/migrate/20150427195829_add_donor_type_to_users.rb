class AddDonorTypeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :donor_type, :string
  end
end
