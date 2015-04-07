class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.references :donor, index: true
      t.string :donor_type
      t.decimal :amount
      t.boolean :matched
      t.string :matching_organization
      t.decimal :match_amount
      t.text :information

      t.timestamps
    end
  end
end
