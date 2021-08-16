class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image

  validates :name, presence: true
  validates :email, uniqueness: true, presence: true
  validates :is_active, inclusion: { in: [true, false] }

  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :records, dependent: :destroy
  has_many :user_tags
  has_many :tags, through: :user_tags

   # フォロー側
  has_many :relationships, dependent: :destroy
  has_many :followings, through: :relationships, source: :follower

  # フォロワー側
  has_many :passive_relationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :user

  # フォローする
  def follow(other_user)
    return if self == other_user
    relationships.find_or_create_by!(follower: other_user)
  end


  # フォローの確認
  def following?(user)
    followings.include?(user)
  end

  # フォローの解除
  def unfollow(relathinoship_id)
    relationships.find(relathinoship_id).destroy!
  end

  def self.search(keyword)
    where(["name like? OR introduction like?", "%#{keyword}%", "%#{keyword}%"])
  end

  # twitter_api
  # def self.find_for_oauth(auth)
  #   user = User.find_by(uid: auth.uid, provider: auth.provider)

  #   user ||= User.create!(
  #     uid: auth.uid,
  #     provider: auth.provider,
  #     name: auth[:info][:name],
  #     email: User.dummy_email(auth),
  #     password: Devise.friendly_token[0, 20]
  #   )
  #   user
  # end

  # def self.dummy_email(auth)
  #   "#{Time.now.strftime('%Y%m%d%H%M%S').to_i}-#{auth.uid}-#{auth.provider}@example.com"
  # end
end
