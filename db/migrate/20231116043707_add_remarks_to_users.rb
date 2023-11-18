class AddRemarksToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :remarks, :text
  end
end
