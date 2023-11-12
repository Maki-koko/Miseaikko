class Note < ApplicationRecord
  
  has_rich_text :content
  has_one_attached :image
  
  has_many :comments, dependent: :destroy
  # コメントを複数もっている
  # has_many :reports, dependent: :destroy
  # 通報内容を複数持っている

  belongs_to :user
  # ノートが繋がっているモデルはuserのみ

end
