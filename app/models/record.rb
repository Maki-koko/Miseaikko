class Record < ApplicationRecord
  
  belongs_to :user
  # 学習記録が繋がっているモデルはuserのみ
  
  has_many :record_favorites, dependent: :destroy

  has_many :reports, as: :reportable, dependent: :destroy
  # 通報内容を複数持っている

  validates :learning_day, presence: true
  validates :study_time, presence: true
  validates :comment, presence: true, length: { maximum: 250 }
  validates :score, presence: true


    # 公開・非公開機能
  scope :share, -> {where(status: true)}
  scope :secret, -> {where(status: false)}

  def favorited_by?(user)
    return false if user.nil?
    record_favorites.exists?(user_id: user.id)
  end
  
  def status_japanese
    if status
      "公開中"
    else
      "非公開"
    end
  end

end
