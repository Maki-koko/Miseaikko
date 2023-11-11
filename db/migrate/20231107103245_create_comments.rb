class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      
      t.integer :user_id, null: false
      t.integer :text,    null: false
      t.boolean :hidden,  null: false, default: true

      t.timestamps
    end
  end
end
