class Post < ApplicationRecord
    belongs_to :user, class_name: 'User', foreign_key: 'author'
    default_scope -> { order(created_at: :desc) }
    
    validates :content, presence: true, length: { maximum: 140 }
    validates :author, presence: true
end
