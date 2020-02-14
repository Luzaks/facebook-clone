class AddIndexToPost < ActiveRecord::Migration[6.0]
  def change
    add_index :posts, :author
  end
end
