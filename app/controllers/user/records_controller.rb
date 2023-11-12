class User::RecordsController < ApplicationController
  def new
  @record = Record.new
  end

  def create
    @record = Record.new(record_params)
    @record.user_id = current_user.id
    if @record.save
      flash[:notice] = "学習時間を記録しました"
      redirect_to user_path(@record.user_id)
    else
    # エラーの場合は戻る
      render :new
    end
  end
  

  def show
    @record = Record.find(params[:id])
  end

  def destroy
    @user = current_user
    @record = Record.find(params[:id])
    if @record.destroy
    flash[:notice] = "学習削除しました"
    redirect_to user_path(@user.id)
    else
    flash[:notice] = "削除できませんでした"
    render :show
    end
  end
  
  private

  def record_params
    params.require(:record).permit(:user_id, :learning_day, :study_time, :comment)
  end
  
end
