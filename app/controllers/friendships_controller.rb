class FriendshipsController < ApplicationController
  def create
    Friendship.create(friendable_id: current_user.id, friend_id: params[:user_id])
    user = User.find(params[:user_id])
    flash[:notice] = "Congrats!! #{user.name} has recieved your friendship request!!!"
    redirect_back(fallback_location: root_path)
  end

  def accept

  end

  def destroy

  end
end
