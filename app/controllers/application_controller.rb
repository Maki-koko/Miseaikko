class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top,:role,:show], unless: :admin_url
  before_action :authenticate_admin!, if: :admin_url 
  before_action :configure_permitted_parameters, if: :devise_controller?

  def admin_url
  request.fullpath.include?("/admin")
  end

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_path
    when User
      user_path(@user.id)
    end
  end
  
  def after_sign_out_path_for(resource)
    root_path
  end
  
  helper_method :logged_in?
  # ユーザーがログインしているかどうかを判定するためのメソッド
  def logged_in?
    session[:user_id].present?
  end
  # ログインしているかによる条件分岐に使用中

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :introduction])
  end

end
