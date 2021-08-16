class AddColumnToRecord < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :comment, :string
    add_column :records, :start_time, :datetime
  end
end
