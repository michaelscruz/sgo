class AddGeneralFundToDonations < ActiveRecord::Migration
  def change
    add_column :donations, :general_fund, :decimal
    add_column :donations, :stripe_customer_token, :string
    add_column :donations, :non_user_donor_id, :integer
   	add_column :users, :non_user_donor_id, :integer
  end
end
