class CreateDisbursements < ActiveRecord::Migration
  def change
    create_table :disbursements do |t|
      t.date :disburse_date
      t.decimal :amount
      t.string :type
      t.integer :awards
      t.string :status

      t.timestamps
    end
  end
end
