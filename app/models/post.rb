class Post < ApplicationRecord
  mount_uploader :post_image, ImageUploader

  belongs_to :category
  belongs_to :user, optional: true
  has_many :comments, dependent: :destroy
end
