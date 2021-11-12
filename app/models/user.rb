class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :posts, dependent: :destroy
  has_many :likes
  has_many :comments
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 50 }
  validates :self_introduction, length: { maximum: 500 }
  enum gender: { man: 0, woman: 1 }

  mount_uploader :profile_image, ProfileImageUploader
end
