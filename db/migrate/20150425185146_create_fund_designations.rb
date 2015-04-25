class CreateFundDesignations < ActiveRecord::Migration
  def change
    create_table :fund_designations do |t|
      t.decimal :percentage
      t.references :school, index: true
      t.references :donation, index: true

      t.timestamps
    end
  end
end
