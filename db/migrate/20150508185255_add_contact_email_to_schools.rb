class AddContactEmailToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :email, :string
  end
end
