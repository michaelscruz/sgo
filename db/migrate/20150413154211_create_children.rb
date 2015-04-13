class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.integer :household_id
      t.date :dob
      t.string :first_name
      t.string :last_name
      t.integer :school_id

      t.timestamps
    end
  end
end
