module FriendshipsHelper
  def check_friendship_relation(user)
    @friends.exists?(friend_id: user.id)
  end
end
