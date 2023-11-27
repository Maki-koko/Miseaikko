class User::SearchesController < ApplicationController
  # def search
  #   @q = Note.ransack(params[:q])
  #   @note = @q.result(distinct: true).where(status: true, hidden: true).page(params[:page])
  #   #ここにページネーションなどを入れられる
  #   @result = params[:q]&.values&.reject(&:blank?)
  # end
  def search
    #Viewのformで取得したパラメータをモデルに渡す
    @notes= Note.search(params[:search]).where(users: { is_active: true }).where(notes: { status: true, hidden: true }).share.order(created_at: :desc).page(params[:page]).per(30)
  end
end
