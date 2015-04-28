class CreateNonUserDonors < ActiveRecord::Migration
  def change
    create_table :non_user_donors do |t|
      t.string :donor_type
      t.string :first_name
      t.string :last_name
      t.string :middle_initial
      t.string :ssn
      t.string :apt
      t.string :city
      t.string :zip
      t.string :state
      t.string :email
      t.string :address

      t.timestamps
    end
  end
end
