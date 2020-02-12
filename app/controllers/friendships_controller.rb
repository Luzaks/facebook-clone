class FriendshipsController < ApplicationController
  def new
    @friendships = Friendship.new
  end

  def create
    user = User.find(params[:id])
    @friendship = Friendship.create(user_id: current_user.id, friend_id: user.id, friendship_status: false)
    if @friendship.save
      flash[:success] = 'Friendship request successfull'
      redirect_to users_path
    else
      flash[:danger] = 'Cannot send friendship request'
      redirect_to users_path
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
