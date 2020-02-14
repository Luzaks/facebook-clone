class Post < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'author'
  has_many :comments, foreign_key: 'post_id'
  has_many :user_id, through: :comment, source: 'User'
  has_many :likes, as: :likeable

  default_scope -> { order(created_at: :desc) }

  validates :content, presence: true, length: { maximum: 140 }
  validates :author, presence: true
end
