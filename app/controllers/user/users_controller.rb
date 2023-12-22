class User::UsersController < ApplicationController
  before_action :set_user, only: [:note_favorites]


  def show
    @user = User.find(params[:id])
    @favorite = NoteFavorite.where(user_id: @user.id).order(created_at: :desc).page(params[:page]).per(10)
    @following_users = @user.following_users.where(is_active: true)
    @follower_users = @user.follower_users.where(is_active: true)
    if @user == current_user
      @notes = @user.notes.order(created_at: :desc).where(notes: { hidden: true }).page(params[:page]).per(10)
      @tags = @notes.includes(:tags).pluck('tags.name').flatten.join(',')
      @record = @user.records.order(learning_day: :desc).where(records: { hidden: true })
    else
      @notes = @user.notes.share.order(created_at: :desc).where(notes: { hidden: true, status: true }).page(params[:page]).per(10)
      @tags = @notes.includes(:tags).pluck('tags.name').flatten.join(',')
      @record = @user.records.share.order(learning_day: :desc).where(records: { hidden: true, status: true })
    end
  end
  # def edit
  #   @user = User.find(params[:id])
  # end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "変更を保存しました"
    else
      flash[:alert] = "変更の保存に失敗しました"
    end
    redirect_to user_path(@user.id)
  end
  
  def quit

  end
  
  def withdraw
    @user = User.find(current_user.id)
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @user.update(is_active: false)
    reset_session
    flash[:notice] = "退会しました"
    redirect_to root_path
  end
  
  def follows
    @user = User.find(params[:id])
    @followx = @user.following_users.where(is_active: true)
  end

  def followers
    @user = User.find(params[:id])
    @followers = @user.follower_users.where(is_active: true)
  end
  

  private

  def user_params
    params.require(:user).permit(:status)
  end

end
