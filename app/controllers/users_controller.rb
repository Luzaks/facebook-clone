class UsersController < ApplicationController
  def show
    current_user
    @posts = current_user.posts.paginate(page: params[:page])
    @post = current_user.posts.build
  end

  def index
    @users = User.all
  end
end
