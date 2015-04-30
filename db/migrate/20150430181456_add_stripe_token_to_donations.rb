class AddStripeTokenToDonations < ActiveRecord::Migration
  def change
    add_column :donations, :stripe_customer_token, :string
  end
end
