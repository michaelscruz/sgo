class AddHouseholdIdToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :household_id, :integer
  end
end
