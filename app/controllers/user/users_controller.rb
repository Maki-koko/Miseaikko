class User::UsersController < ApplicationController

  before_action :ensure_guest_user, only: [:edit]

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  def puit
  end
  
  def withdraw
  end
  

  private

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.email == "guest@example.com"
      redirect_to users_my_page_path , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end  

end
