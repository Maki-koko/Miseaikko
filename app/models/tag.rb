class Tag < ApplicationRecord
  has_many :tag_relationships, dependent: :destroy
  has_many :notes, through: :tag_relationships

  validates :name, length: { maximum: 50 }
end
