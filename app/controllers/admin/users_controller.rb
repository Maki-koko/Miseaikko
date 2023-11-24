class Admin::UsersController < ApplicationController
  def index
    @users = User.includes(:notes, :records, :comments).page(params[:page]).per(30)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "変更が完了しました"
      redirect_to edit_admin_user_path(@user)
    else
      render :edit
    end
  end
  
  

private
  def user_params
    params.require(:user).permit(:email, :is_active, :remarks)
  end
end
