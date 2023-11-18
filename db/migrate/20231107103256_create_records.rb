class CreateRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :records do |t|

      t.integer :user_id, null: false
      t.boolean :status,  null: false, default: false
      t.date :learning_day, null: false
      t.integer :study_time, null: false
      t.string :comment,    null: false
      t.boolean :hidden,  null: false, default: true
      t.integer :report_id
      t.timestamps
    end
  end
end