class CreateApplicationFiles < ActiveRecord::Migration
  def change
    create_table :application_files do |t|
      t.integer :application_id
      t.attachment :file

      t.timestamps
    end
  end
end
