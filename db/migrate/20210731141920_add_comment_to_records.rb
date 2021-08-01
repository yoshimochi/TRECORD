class AddCommentToRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :comment, :text
  end
end
