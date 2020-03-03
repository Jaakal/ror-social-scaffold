class ChangeStatusFromFriendships < ActiveRecord::Migration[5.2]
  def change
    remove_column :friendships, :status
    add_column :friendships, :status, :boolean, default: :false
  end
end
