class User::HomesController < ApplicationController
  def top
    # 投稿最新10件を表示する
    @note = Note.joins(:user).where(users: { is_active: true }).share.order(created_at: :desc).limit(10)
  end

  def role
  end
end
