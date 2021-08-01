class CreateEventData < ActiveRecord::Migration[5.2]
  def change
    create_table :event_data do |t|

      t.timestamps
    end
  end
end
