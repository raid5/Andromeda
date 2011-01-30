class Cluster < ActiveRecord::Base
  belongs_to :user
  has_many :posts
  
  validates_presence_of :name, :description, :user
  
  default_scope :order => 'clusters.created_at DESC'
end
