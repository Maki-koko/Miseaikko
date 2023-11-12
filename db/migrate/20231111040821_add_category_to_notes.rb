class AddCategoryToNotes < ActiveRecord::Migration[6.1]
  def change
    add_column :notes, :category, :string
  end
end
