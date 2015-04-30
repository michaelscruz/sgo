class AddMiddleInitialToUsers < ActiveRecord::Migration
  def change
    add_column :users, :middle_initial, :string
    add_column :users, :stripe_customer_token, :string
  end
end
