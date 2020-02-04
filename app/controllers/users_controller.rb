class UsersController < ApplicationController

    def show
        current_user
        @posts = @current_user.posts
    end 

    def index
    @users= User.all
    end

end
