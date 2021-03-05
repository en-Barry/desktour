class Post < ApplicationRecord
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :post_images, dependent: :destroy
  belongs_to :user
end
