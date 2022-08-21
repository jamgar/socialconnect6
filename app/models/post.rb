class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image


  validates :image, image: true
  validates :content, presence: true
end
