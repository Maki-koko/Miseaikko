class User::HomesController < ApplicationController
  def top
    # 投稿最新10件を表示する
    @note = Note.order(created_at: :desc).limit(10)
  end

  def role
  end
end
