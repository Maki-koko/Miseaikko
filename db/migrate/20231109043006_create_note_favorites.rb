class CreateNoteFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :note_favorites do |t|
      
      t.integer :note_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
