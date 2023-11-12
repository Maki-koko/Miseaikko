class AddNoteIdToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :note_id, :integer
  end
end
