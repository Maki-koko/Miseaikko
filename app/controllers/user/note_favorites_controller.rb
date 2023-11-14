class User::NoteFavoritesController < ApplicationController
  def create
    note = Note.find(params[:note_id])
    favorite = current_user.note_favorites.new(note_id: note.id)
    favorite.save
    redirect_to note_path(note)
  end

  def destroy
    note = Note.find(params[:note_id])
    favorite = current_user.note_favorites.find_by(note_id: note.id)
    favorite.destroy
    redirect_to note_path(note)
  end
end
