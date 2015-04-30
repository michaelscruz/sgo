class AddPaperToDonations < ActiveRecord::Migration
  def change
    add_column :donations, :payment_type, :string
    add_column :donations, :check_number, :integer
  end
end
