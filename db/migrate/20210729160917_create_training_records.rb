class CreateTrainingRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :training_records do |t|
      t.integer "record_id", null: false
      t.string "name"
      t.timestamps
    end
  end
end
