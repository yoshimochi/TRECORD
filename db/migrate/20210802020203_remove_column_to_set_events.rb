class RemoveColumnToSetEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :set_events, :event_id, :integer
    remove_column :set_events, :eventdatum_id, :integer
  end
end
