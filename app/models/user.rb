class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :set_events, dependent: :destroy
  has_many :records, dependent: :destroy
  has_many :user_tags
  has_many :tags, through: :user_tags
end
