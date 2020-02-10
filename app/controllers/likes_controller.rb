class LikesController < ApplicationController

  def create
    @like = Like.new(user_id: current_user.id)
    if @like
      flash[:success] = "Liked!"
      @like = @likeable.likes.create(user_id: current_user.id)
      redirect_to authenticated_root_path
    else
      flash[:danger] = "Already liked"
      redirect_to authenticated_root_path
    end
    
  end  

  def destroy
    @post = Post.find(params[:post_id])
    @post_liked_id = @post.likes.find(params[:id])
    
    if @post_liked_id
      @post_liked_id.destroy
      flash[:success] = "Unliked!"
      redirect_to authenticated_root_path
    else
      flash[:notice] = "Cannot unlike"
      redirect_to authenticated_root_path
    end
  end
end
