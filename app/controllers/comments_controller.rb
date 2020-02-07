class CommentsController < ApplicationController

    before_action :authenticate_user!, only: [:destroy, :create]

    def create
        @posts = Post.find(params[:post_id])
        @comment = current_user.comments.create(comment_params)
        if @comment.save
            flash[:success] = 'Comment created!'
            redirect_to current_user
          else
            flash[:danger] = 'Try again a comment!'
            @comment.errors.full_messages
            redirect_to current_user
          end
    end

    def destroy
    @comment = current_user.comments.find_by(id: params[:id])
    if @user != current_user
        flash[:danger] = 'You cant delete this comment'
        redirect_to current_user
    else
        @comment.destroy
        flash[:success] = 'Post deleted'
    end
    
    end

    private

  def comment_params
    params.require(:comment).permit(:text)
  end

end
