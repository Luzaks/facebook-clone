class User < ApplicationRecord
  has_many :posts, foreign_key: 'author', dependent: :destroy
  has_many :comments, foreign_key: 'user_id'
  has_many :comment_id, through: :comment, source: 'Post'
  has_many :likes, foreign_key: 'user_id'
  has_many :friendships
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def friends
    result = []
    friendships.where(friendship_status: true).each do |x|
      result << x.friend
    end
    result
  end

  def inverse_friends
    result = [self]
    inverse_friendships.where(friendship_status: true).each do |x|
      result << x.user
    end
    result
  end

  def friends_and_own_posts
    Post.where(user: (friends + inverse_friends))
  end

  validates :name, presence: true
  validates :lastname, presence: true
end
