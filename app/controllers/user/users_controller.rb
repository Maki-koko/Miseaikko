class User::UsersController < ApplicationController

  before_action :set_user, only: [:note_favorites]


  def show
    @user = User.find(params[:id])
    @note = @user.notes.order(created_at: :desc)
    @record = @user.records.order(learning_day: :desc)
    @favoite = NoteFavorite.where(user_id: @user.id).order(created_at: :desc)
    @following_users = @user.following_users
    @follower_users = @user.follower_users
  end

  # def edit
  #   @user = User.find(params[:id])
  # end

  # def update
  # @user = User.find(params[:id])
  # if @user.update(user_params)
  #   flash[:notice] = "変更を保存しました"
  #   redirect_to user_path(@user.id)
  # else
  #   render :edit
  # end
  # end
  
  def quit
  end
  
  def withdraw
  end
  
  def follows
    user = User.find(params[:id])
    @users = user.following_users
  end

  def followers
    user = User.find(params[:id])
    @user = user.follower_users
  end
  

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :email)
  end

end
