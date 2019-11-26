class Product < ApplicationRecord
    has_many :histories
    has_many :restriction_tags
    has_many :restrictions, through: :restriction_tags

    validates :barcode, presence: true
    validates :label_photo, presence: true

    mount_uploader :front_photo, PhotoUploader
    mount_uploader :label_photo, PhotoUploader
  
end

