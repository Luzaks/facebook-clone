module ApplicationHelper
  def notification_counter(user)
    friendship3 = user.inverse_friendships.select { |x| x.friendship_status == false }
  end

  def friends_with?(post_user)
    return true if current_user.friendships.where(user_id: current_user.id, friend_id: post_user, friendship_status: true).exists?
    return true if current_user.inverse_friendships.where(user_id: post_user, friend_id: current_user, friendship_status: true).exists?
  end

  def isit_me?(post_user)
    post_user == current_user
  end
end
