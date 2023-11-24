class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.integer :user_id, null: false
      t.string :reportable_type, null: false
      # typeはRubyで予約語として使用するため使用不可
      t.integer :reportable_id, null: false
      t.text :text
      t.boolean :report_status, null: false, default:false
      t.text :remarks
      t.timestamps
    end
  end
end
