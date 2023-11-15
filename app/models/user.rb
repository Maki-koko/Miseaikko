class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :notes, dependent: :destroy
  # ノートを複数持っている
  has_many :records, dependent: :destroy
  # 学習記録を複数持っている
  has_many :comments, dependent: :destroy
  # コメントを複数できる
  has_many :note_favorites, dependent: :destroy
  has_many :record_favorites, dependent: :destroy

  has_many :followers, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followeds, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

  has_many :following_users, through: :followers, source: :followed
  has_many :follower_users, through: :followeds, source: :follower

  GUEST_USER_EMAIL = "guest@example.com"

  def active_for_authentication?
    super && (is_active == true)
  end

  def self.guest
    find_or_create_by!(email: GUEST_USER_EMAIL) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲストユーザー"
    end
  end
  
  def guest_user?
    email == GUEST_USER_EMAIL
  end

  def follow(user_id)
    followers.create(followed_id: user_id)
  end
  
  def unfollow(user_id)
    followers.find_by(followed_id: user_id).destroy
  end
  
  def following?(user)
    following_users.include?(user)
  end	 

end
