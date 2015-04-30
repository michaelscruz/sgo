class AddStripeToNonUserDonors < ActiveRecord::Migration
  def change
    add_column :non_user_donors, :stripe_customer_token, :string
    remove_column :donations, :stripe_customer_token, :string
  end
end
