class AddEventDataIdToSetEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :set_events, :event_data_id, :integer
  end
end
