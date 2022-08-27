class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy


  validates :image, image: true
  validates :content, presence: true
end
