class RemoveColumnToTrainingRecords < ActiveRecord::Migration[5.2]
  def change
    remove_column :training_records, :weight, :floot
    remove_column :training_records, :rep, :integer
    remove_column :training_records, :set, :integer
    remove_foreign_key :training_records, :events
    remove_reference :training_records, :event, index: true
  end
end
