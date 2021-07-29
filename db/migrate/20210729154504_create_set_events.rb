class CreateSetEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :set_events do |t|
      t.float "weight", default: 0
      t.integer "rep", default: 0
      t.integer "set", default: 0
      t.integer "event_id"
      t.integer "user_id"
      t.integer "record_id"

      t.timestamps
    end
  end
end