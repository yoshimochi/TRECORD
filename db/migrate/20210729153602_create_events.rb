class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      
      t.integer "genre_id", null: false
      t.text "name", null: false
      t.float "weight"
      t.integer "repetition"

      t.timestamps
    end
  end
end
