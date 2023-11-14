class TagRelationship < ApplicationRecord
  belongs_to :note
  belongs_to :tag
  # タグ付けのバリデーション・アソシエーション
  # validateで重複を防ぐ
  validates :note_id, presence: true
  validates :tag_id, presence: true
end
