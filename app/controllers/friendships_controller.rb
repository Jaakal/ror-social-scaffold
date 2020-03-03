class FriendshipsController < ApplicationController
  def create
    Friendship.create(friendable_id: current_user.id, friend_id: params[:user_id])
    user = User.find(params[:user_id])
    flash[:notice] = "Congrats!! #{user.name} has recieved your friendship request!!!"
    redirect_back(fallback_location: root_path)
  end

  def accept
    user = User.find(params[:user_id])
    friendship = Friendship.find_by(friendable_id: params[:user_id], friend_id: current_user.id)
    friendship.update(status: true)
    flash[:notice] = "You have accepted #{user.name} as your friend!!!"
    redirect_back(fallback_location: root_path)
  end

  def destroy
    user = User.find(params[:user_id])
    friendship = Friendship.find_by(friendable_id: params[:user_id], friend_id: current_user.id)
    friendship.destroy
    flash[:notice] = "You have rejected #{user.name} as your friend!!"
    redirect_back(fallback_location: root_path)
  end
end
