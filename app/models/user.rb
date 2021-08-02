class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image
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

end
