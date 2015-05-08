class RemoveChoiceScholarshipExplanation < ActiveRecord::Migration
  def change
  	remove_column :applications, :choice_scholarship_explanation, :text
  end
end
