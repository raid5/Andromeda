class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.integer :post_type, :default => 0
      t.string :title
      t.string :description
      t.string :url

      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
