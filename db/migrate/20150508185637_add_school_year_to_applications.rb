class AddSchoolYearToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :school_year, :string
  end
end
