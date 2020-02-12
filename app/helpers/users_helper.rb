module UsersHelper
  def gravatar_for(current_user)
    gravatar_id = Digest::MD5.hexdigest(current_user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: current_user.name, class: 'gravatar')
  end


  # Users who have yet to confirme friend 
  def pending_for_accept_my_request(user)
    friendship1= @friendships.map{|friendship| friendship.friend if !friendship.friendship_status}.compact
    friendship1.include?(user)
  end

  def pending_for_me_to_accept(user)
   friendship_2= @inverse_friendships.map{|friendship| friendship.user if !friendship.friendship_status}.compact
   friendship_2.include?(user)
  end

  def we_are_friends(user)
    friends_list = @friendships.map{|friendship| friendship.friend if friendship.friendship_status}
    friends_list += @inverse_friendships.map{|friendship| friendship.user if friendship.friendship_status}
    friends_list.compact
    friends_list.include?(user)

  end

  
end
