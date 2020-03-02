module FriendshipsHelper

  def check_friendship_relation user
    @sender.each do |friendship_record|
      return true if friendship_record.friend_id == user.id
    end
    @reciver.each do |friendship_record|
      return true if friendship_record.friendable_id == user.id
    end
    false
  end
end
