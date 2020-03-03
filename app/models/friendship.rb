class Friendship < ApplicationRecord
  after_update :create_inverse_friendship
  belongs_to :sender, foreign_key: :friendable_id, class_name: 'User'
  belongs_to :reciver, foreign_key: :friend_id, class_name: 'User'

  private

  def create_inverse_friendship
    reciver.friendships.create(friend_id: sender.id, status: true)
  end
end
