class AddAssociationsIdsToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :user_id, :integer
    add_column :posts, :cluster_id, :integer
  end

  def self.down
    remove_column :posts, :cluster_id
    remove_column :posts, :user_id
  end
end
