class AddDescriptionToClusters < ActiveRecord::Migration
  def self.up
    add_column :clusters, :description, :string
  end

  def self.down
    remove_column :clusters, :description
  end
end
