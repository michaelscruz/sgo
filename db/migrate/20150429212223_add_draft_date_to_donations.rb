class AddDraftDateToDonations < ActiveRecord::Migration
  def change
    add_column :donations, :draft_date, :integer
  end
end
