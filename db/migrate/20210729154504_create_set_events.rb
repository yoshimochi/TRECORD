class CreateSetEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :set_events do |t|
      t.float "weight"
      t.integer "rep"
      t.integer "set"
      t.float "max"
      t.integer "training_record_id"

      t.timestamps
    end
  end
end
