class Friendship < ApplicationRecord
  after_create :create_inverse_friendship
  belongs_to :sender, foreign_key: :friendable_id, class_name: 'User'
  belongs_to :reciver, foreign_key: :friend_id, class_name: 'User'

  private

  def create_inverse_friendship   
    reciver.friendships.create(friend_id: sender.id)  if !already_friends?
  end

  def already_friends?
    reciver.friendships.exists?(friend_id: sender.id)
  end
end
