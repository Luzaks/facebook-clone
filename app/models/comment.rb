class Comment < ApplicationRecord
    belongs_to :post, class_name: 'Post', foreign_key: 'post_id'
    belongs_to :user, class_name: 'User', foreign_key: 'user_id'
    has_many :likes, as: :likeable


    default_scope -> { order(created_at: :desc) }

    validates :text, presence: true, length: { maximum: 140 }
    validates :user_id, presence: true
end
