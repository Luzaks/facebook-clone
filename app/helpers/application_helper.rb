module ApplicationHelper
  def notification_counter(user)
    friendship3 = user.inverse_friendships.select { |x| x.friendship_status == false }
  end
end
