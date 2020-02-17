class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:destroy, :create]

  def index
    @post = Post.new
    @posts = current_user.friends_and_own_posts
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = 'post created!'
      redirect_to authenticated_root_path

    else
      flash[:danger] = 'Try again!'
      redirect_to authenticated_root_path
    end
  end

  def edit
  end

  def destroy
    @post = current_user.posts.find_by(id: params[:id])
    @post.destroy
    flash[:success] = 'Post deleted'
    redirect_to current_user
 end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
