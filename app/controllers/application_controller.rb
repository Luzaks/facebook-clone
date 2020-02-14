class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :friends_and_myself 

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name lastname])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name lastname])
  end

  def friends_and_myself(user)
    friends_list = user.friendships.map { |friendship| friendship.friend if friendship.friendship_status }
    friends_list += user.inverse_friendships.map { |friendship| friendship.user if friendship.friendship_status }
    friends_list.compact
    friends_list << user
  end


end
