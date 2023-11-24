class Comment < ApplicationRecord
  
  belongs_to :user
  belongs_to :note
  
 has_many :reports, as: :reportable , dependent: :destroy
  # 通報内容を複数持っている

  validates :user_id, presence: true
  validates :text, presence: true, length: { in: 1..500 }
  validates :note_id, presence: true

end
