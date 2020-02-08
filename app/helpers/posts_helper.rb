module PostsHelper
  def authenticated_user?
    current_user == @post.user
  end

 
end
