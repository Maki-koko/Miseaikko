class AddStatusToNotes < ActiveRecord::Migration[6.1]
  def change
    add_column :notes, :status, :boolean, null: false, default: false
  end
end
