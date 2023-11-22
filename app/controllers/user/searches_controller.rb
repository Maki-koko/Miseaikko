class User::SearchesController < ApplicationController
  def search
    @q = Note.ransack(params[:q])
    @note = @q.result(distinct: true).where(status: true, hidden: true).page(params[:page])
    #ここにページネーションなどを入れられる
    @result = params[:q]&.values&.reject(&:blank?)
  end
end
