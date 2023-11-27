class Note < ApplicationRecord
  
  has_rich_text :content
  has_one_attached :image
  
  has_many :tag_relationships, dependent: :destroy
  has_many :tags, through: :tag_relationships
  # throughでtagテーブルのタグのカラムを取る
  
  has_many :note_favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
# コメントを複数できる
  has_many :reports, as: :reportable, dependent: :destroy
  # 通報内容を複数持っている

  belongs_to :user
  # ノートが繋がっているモデルはuserのみ
  
  validates :title, presence: true
  # 公開・非公開機能
  scope :share, -> {where(status: true)}
  scope :secret, -> {where(status: false)}

  def favorited_by?(user)
    return false if user.nil?
    note_favorites.exists?(user_id: user.id)
  end

def self.search(search)
  return Note.none unless search.present?
  
  Note.joins(:user).where(['title LIKE ? AND users.is_active = ? AND notes.status = ? AND notes.hidden = ?', "%#{search}%", true, true, true])
end

  # タグ検索に使うコード
  def save_tags(tags)
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    old_tags = current_tags - tags
    # 消す予定のタグ(old_tags)＝current_tags(今のタグ)-送られてきたタグ
    new_tags = tags - current_tags
    # 増えたタグ(new_tags)＝送られてきたタグ-current_tags(今のタグ)

    # old_tagsを消す
    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(name:old_name)
    end

    # new_tagsを保存
    new_tags.each do |new_name|
      tag = Tag.find_or_create_by(name:new_name)
      self.tags << tag
    end
  end
  
  # ransackに使うコード
  # def self.ransackable_attributes(auth_object = nil)
  #   ["category", "created_at", "hidden", "id", "status", "title", "updated_at", "user_id"]
  # end
  
  # def self.ransackable_associations(auth_object = nil)
  #   ["tags", "user"]
  #   # "rich_text_content", "tag_relationships",を除外中
  # end

end
