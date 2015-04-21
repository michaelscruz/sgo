class AddNameToApplicants < ActiveRecord::Migration
  def change
    add_column :applicants, :first_name, :string
    add_column :applicants, :last_name, :string
    add_column :applicants, :dob, :date
  end
end
