class User::UsersController < ApplicationController

  before_action :ensure_guest_user, only: [:edit]

  def show
    @user = User.find(params[:id])
    @note = @user.notes
    @record = @user.records
  end

  def edit
  end

  def update
  end
  
  def quit
  end
  
  def withdraw
  end
  

  private

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.email == "guest@example.com"
      redirect_to user_path , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end  

end
