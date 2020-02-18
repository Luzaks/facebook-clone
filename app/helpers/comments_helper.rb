module CommentsHelper
  def authenticated_comment?(user)
    user == current_user.name
  end
end
