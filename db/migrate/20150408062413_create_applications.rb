class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.references :school, index: true
      t.references :applicant, index: true
      t.decimal :requested_amount

      t.timestamps
    end
  end
end
