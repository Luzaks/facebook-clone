class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:destroy, :create]
  before_action :get_post

  def index
    @comments = @post.comments
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.post_id = params[:post_id]

    if @comment.save
      flash[:success] = 'Comment created!'
      redirect_to authenticated_root_path
    else
      flash[:danger] = 'Cannot create comment!'
      redirect_to authenticated_root_path
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    if @comment.destroy
      flash[:success] = 'Comment destroy!'
      redirect_to authenticated_root_path
    else
      flash[:danger] = 'Cannot destroy!'
      redirect_to authenticated_root_path
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end

  def get_post
    @post = Post.find(params[:post_id])
  end
end
