class Note < ApplicationRecord
  
  has_rich_text :content
  has_one_attached :image
  
  has_many :comments, dependent: :destroy
  # コメントを複数もっている
  # has_many :reports, dependent: :destroy
  # 通報内容を複数持っている

  belongs_to :user
  # ノートが繋がっているモデルはuserのみ

  has_many :note_favorites, dependent: :destroy
  # コメントを複数できる

  def favorited_by?(user)
    return false if user.nil?
    note_favorites.exists?(user_id: user.id)
  end
end
