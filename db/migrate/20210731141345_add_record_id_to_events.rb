class AddRecordIdToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :record_id, :integer
  end
end
