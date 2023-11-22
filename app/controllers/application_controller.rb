class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top,:role,:index, :show], unless: :admin_url
  before_action :authenticate_admin!, if: :admin_url 
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :search
  
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
  
  # helper_method :logged_in?
  # # ユーザーがログインしているかどうかを判定するためのメソッド
  # def logged_in?
  #   session[:user_id].present?
  # end
  # # ログインしているかによる条件分岐に使用中

  def search
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :introduction])
  end

end

     
        
        #@q = User.ransack(params[:q])
        #@user = @q.result(distinct: true).page(params[:page])
        #ここにページネーションなどを入れられる
       # @result = params[:q]&.values&.reject(&:blank?)


        #@q = Note.ransack(params[:q])
        #@note = @q.result(distinct: true).page(params[:page])
        #ここにページネーションなどを入れられる
       # @result = params[:q]&.values&.reject(&:blank?)
        # params[:q] から空でない値のみを取り出し@result に代入
        # 取り出す値がない場合→nilを返し、.valuesや.reject(&:blank?) を実行する