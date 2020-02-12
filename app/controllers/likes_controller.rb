class LikesController < ApplicationController
  def create
    @like = Like.new(user_id: current_user.id)
    if @like
      flash[:success] = 'Liked!'
      @like = @likeable.likes.create(user_id: current_user.id)
      redirect_to authenticated_root_path
    else
      flash[:danger] = 'Already liked'
      redirect_to authenticated_root_path
    end
  end

  def destroy
    @like_id = @likeable.likes.find(params[:id])

    if @like_id
      @like_id.destroy
      flash[:success] = 'Unliked!'
      redirect_to authenticated_root_path
    else
      flash[:notice] = 'Cannot unlike'
      redirect_to authenticated_root_path
    end
  end
end
