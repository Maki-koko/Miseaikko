class User::RecordFavoritesController < ApplicationController
  def create
    @record = Record.find(params[:record_id])
    favorite = current_user.record_favorites.new(record: @record)  # モデルの関連付けを使用していいねを作成する
    favorite.save
    redirect_to user_path(@record.user_id)
  end

  def destroy
    @record = Record.find(params[:record_id])
    favorite = current_user.record_favorites.find_by(record: @record)  # モデルの関連付けを使用していいねを見つける
    favorite.destroy
    redirect_to user_path(@record.user_id)
  end
end