class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_restrictions
  has_many :restrictions, through: :user_restrictions
  has_many :histories
  mount_uploader :avatar, PhotoUploader

  validates :name, uniqueness: true, presence: true
end
