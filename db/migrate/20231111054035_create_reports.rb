class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.integer :user_id, null: false
      t.integer :reportable_type, null: false
      # typeはRubyで予約語として使用するため使用不可
      t.integer :reportable_id, null: false
      t.text :text, null: false
      t.boolean :report_status, null: false, default:false
      t.text :remarks, null: false
      t.timestamps
    end
  end
end
