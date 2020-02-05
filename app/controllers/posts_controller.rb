class PostsController < ApplicationController

    def create
        @post = current_user.posts.build(post_params)
        if @post.save
          flash[:success] = "post created!"
          redirect_to :authenticated_root
        else
         flash[:danger] = "No post created!"
         redirect_to :authenticated_root
        end
    end

    def edit
    end

    def destroy
    end

    private

    def post_params
      params.require(:post).permit(:content)
    end

end
