class PostsController < ApplicationController
  before_action :correct_user, only: :destroy

  def index
    @posts = Post.all
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = 'post created!'
      redirect_to :authenticated_root
    else
      flash[:danger] = 'Try again!'
      redirect_to :authenticated_root
    end
  end

  def edit
  end

  def destroy
    @post = current_user.posts.find_by(id: params[:id])
    @post.destroy
    flash[:success] = 'Post deleted'
    redirect_to :authenticated_root
 end

  private

  def post_params
    params.require(:post).permit(:content)
  end

  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    redirect_to :authenticated_root if @post.nil?
  end
end
