class Record < ApplicationRecord
  
  belongs_to :user
  # 学習記録が繋がっているモデルはuserのみ
  
  has_many :record_favorites, dependent: :destroy

  scope :open, -> {where(status: true)}
  scope :close, -> {where(status: false)}

  def favorited_by?(user)
    return false if user.nil?
    record_favorites.exists?(user_id: user.id)
  end

end
