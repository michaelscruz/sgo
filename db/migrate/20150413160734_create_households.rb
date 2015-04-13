class CreateHouseholds < ActiveRecord::Migration
  def change
    create_table :households do |t|
      t.decimal :income
      t.integer :number_in_household
      t.string :address
      t.string :address_two
      t.string :city
      t.string :state
      t.string :zip
      t.integer :household_user_id

      t.timestamps
    end
  end
end
