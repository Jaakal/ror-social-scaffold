class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @sender = Friendship.where(friendable_id: current_user.id)
    @reciver = Friendship.where(friend_id: current_user.id)
    @users = User.all
  end

  def show
    @sender = Friendship.where(friendable_id: current_user.id)
    @reciver = Friendship.where(friend_id: current_user.id)
    @user = User.find(params[:id])
    @posts = @user.posts.ordered_by_most_recent
  end
end
