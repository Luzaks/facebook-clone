class AddIndexToFriendship < ActiveRecord::Migration[6.0]
  def change
    add_index :friendships, :friendship_status
  end
end
