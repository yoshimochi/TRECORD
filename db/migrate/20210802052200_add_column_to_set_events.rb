class AddColumnToSetEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :set_events, :max, :string
  end
end
