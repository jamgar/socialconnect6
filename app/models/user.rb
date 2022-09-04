class User < ApplicationRecord
  acts_as_voter
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile, dependent: :destroy
  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :friendships, dependent: :destroy
  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id", dependent: :destroy

  after_create do
    self.create_profile
  end

  def confirmed_friends
    self.friendships.map { |friendship| friendship.friend if friendship.confirmed }.compact
  end

  def confirmed_inverse_friends
    self.inverse_friendships.map { |friendship| friendship.user if friendship.confirmed }.compact
  end

  def display_posts
    Post.where(user: (confirmed_friends + confirmed_inverse_friends + [self]))
  end
  
end