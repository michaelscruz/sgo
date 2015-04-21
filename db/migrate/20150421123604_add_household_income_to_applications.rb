class AddHouseholdIncomeToApplications < ActiveRecord::Migration
  def change
  	add_column :applications, :number_in_household, :integer
    add_column :applications, :household_income, :decimal
  end
end
