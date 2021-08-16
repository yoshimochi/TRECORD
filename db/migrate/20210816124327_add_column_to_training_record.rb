class AddColumnToTrainingRecord < ActiveRecord::Migration[5.2]
  def change
    add_column :training_records, :record_id, :integer
  end
end
