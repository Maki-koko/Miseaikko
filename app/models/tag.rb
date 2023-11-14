class Tag < ApplicationRecord
  has_many :tag_relationships, dependent: :destroy
  has_many :notes, through: :tag_relationships
end
