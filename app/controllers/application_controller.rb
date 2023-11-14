class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_path(@user.id)
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
