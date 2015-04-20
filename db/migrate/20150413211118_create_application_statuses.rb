class CreateApplicationStatuses < ActiveRecord::Migration
  def change
    create_table :application_statuses do |t|
      t.integer :user_id
      t.integer :status_code
      t.integer :application_id
      t.text :notes

      t.timestamps
    end
  end
end
