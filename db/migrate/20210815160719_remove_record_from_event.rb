class RemoveRecordFromEvent < ActiveRecord::Migration[5.2]
  def change
    remove_reference :events, :record, foreign_key: true
  end
end
