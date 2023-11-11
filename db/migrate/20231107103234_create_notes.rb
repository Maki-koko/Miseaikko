class CreateNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notes do |t|
      
      t.integer :user_id, null: false
      t.integer :title, null: false
      t.boolean :hidden,  null: false, default: true

      t.timestamps
    end
  end
end
