class AddRecordIdToEventDatum < ActiveRecord::Migration[5.2]
  def change
    add_column :event_data, :record_id, :integer
  end
end
