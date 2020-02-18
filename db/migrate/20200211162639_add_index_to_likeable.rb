class AddIndexToLikeable < ActiveRecord::Migration[6.0]
  def change
    add_index :likes, :likeable_type
    add_index :likes, :likeable_id
  end
end
