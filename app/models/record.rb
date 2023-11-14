class Record < ApplicationRecord
  
  belongs_to :user
  # 学習記録が繋がっているモデルはuserのみ
  
  has_many :record_favorites, dependent: :destroy

  # scope :open, -> {where(status: true)}
  # scope :close, -> {where(status: false)}

    # 公開・非公開機能
  scope :share, -> {where(status: true)}
  scope :secret, -> {where(status: false)}

  def favorited_by?(user)
    return false if user.nil?
    record_favorites.exists?(user_id: user.id)
  end
  
  def status_japanese
    if status
      "公開中"
    else
      "非公開"
    end
  end

end
