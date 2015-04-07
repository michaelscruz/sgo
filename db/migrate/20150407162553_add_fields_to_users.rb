class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :address, :text
    add_column :users, :phone, :string
    add_column :users, :relation, :string
  end
end
