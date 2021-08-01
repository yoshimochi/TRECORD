class RemoveColumnsInSetEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :set_events, :user_id, :integer
    remove_column :set_events, :record_id, :integer
  end
end
