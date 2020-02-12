class User < ApplicationRecord
  has_many :posts, foreign_key: 'author', dependent: :destroy
  has_many :comments, foreign_key: 'user_id'
  has_many :comment_id, through: :comment, source: 'Post'
  has_many :likes, foreign_key: 'user_id'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :lastname, presence: true
end
