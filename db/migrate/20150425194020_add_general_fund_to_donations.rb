class AddGeneralFundToDonations < ActiveRecord::Migration
  def change
    add_column :donations, :general_fund, :decimal
  end
end
