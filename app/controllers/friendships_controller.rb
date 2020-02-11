class FriendshipsController < ApplicationController


    def new
    end

    def create
        @friendship = Friendship.new(user: current_user, friend: @friend)
        @friend = User.find(params[:friend_id])
        if @frienship
            @friendship = Friendship.create(user: current_user, friend: @friend, friendship_status: false)
            flash[:success] = 'Friend request saved!'
            redirect_to authenticated_root_path

        else
            flash[:danger] = 'Try again!'
            redirect_to authenticated_root_path
        end
    end

    def edit
        @friendship = update_attribute(:friendship_status, true)
        redirect_to authenticated_root_path
    end

    def destroy
        @friendship.destroy
        redirect_to authenticated_root_path
    end
end
