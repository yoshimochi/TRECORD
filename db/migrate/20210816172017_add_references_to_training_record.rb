class AddReferencesToTrainingRecord < ActiveRecord::Migration[5.2]
  def change
    add_reference :training_records, :event, foreign_key: true
  end
end
