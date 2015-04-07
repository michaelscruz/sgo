class CreateApplicants < ActiveRecord::Migration
  def change
    create_table :applicants do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_init
      t.text :address
      t.string :city
      t.string :apt
      t.string :state
      t.string :zip
      t.date :birthdate
      t.integer :grade
      t.boolean :attended_public_or_charter

      t.timestamps
    end
  end
end
