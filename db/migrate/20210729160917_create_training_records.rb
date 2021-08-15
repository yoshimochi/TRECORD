class CreateTrainingRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :training_records do |t|
      t.integer "record_id", null: false
      t.integer "event_id", null: false
      t.integer "user_id"
      t.float "weight"
      t.integer "rep"
      t.integer "set"

      t.timestamps
    end
  end
end
