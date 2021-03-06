class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @friends = Friendship.where(friendable_id: current_user.id)
    @users = User.all
  end

  def show
    @friends = Friendship.where(friendable_id: current_user.id)
    @user = User.find(params[:id])
    @posts = @user.posts.ordered_by_most_recent
  end

  def invitation
    @invitations = Friendship.where(friend_id: current_user.id, status: false)
  end
end
