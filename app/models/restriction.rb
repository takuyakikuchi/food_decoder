class Restriction < ApplicationRecord
  has_many :user_restrictions
  has_many :users, through: :user_restrictions
  has_many :restriction_tags
  has_many :products, through: :restriction_tags

  validates :name, presence: true
  validates :description, presence: true
end
