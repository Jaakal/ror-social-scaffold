class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @post = Post.new
    timeline_posts
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to posts_path, notice: 'Post was successfully created.'
    else
      timeline_posts
      render :index, alert: 'Post was not created.'
    end
  end

  private

  def timeline_posts
    sender = Friendship.where(friendable_id: current_user.id, status: 1).pluck(:friend_id)
    reciver = Friendship.where(friend_id: current_user.id, status: 1).pluck(:friendable_id)
    @timeline_posts ||= Post.where(user_id: [current_user.id] + sender + reciver).ordered_by_most_recent.includes(:user)
  end

  def post_params
    params.require(:post).permit(:content)
  end
end
