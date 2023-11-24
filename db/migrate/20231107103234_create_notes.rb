class CreateNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notes do |t|
      
      t.integer :user_id, null: false
      t.string :title, null: false
      t.boolean :hidden, null: false, default: true
      t.boolean :status, null:false, default: false
      t.integer :report_id
      t.timestamps
    end
  end
end
