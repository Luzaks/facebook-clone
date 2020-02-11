module LikesHelper
  def like_unlike(post)
    post.likes.find { |liked| liked.user_id == current_user.id }
  end
end
