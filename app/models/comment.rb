class Comment < ApplicationRecord
  
  belongs_to :user
  belongs_to :note
  
  # has_many :reports, dependent: :destroy
  # 通報内容を複数持っている

  
end
