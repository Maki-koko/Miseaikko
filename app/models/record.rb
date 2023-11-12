class Record < ApplicationRecord
  
  belongs_to :user
  # 学習記録が繋がっているモデルはuserのみ

  scope :open, -> {where(status: true)}
  scope :close, -> {where(status: false)}

end
