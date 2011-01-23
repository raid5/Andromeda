class Cluster < ActiveRecord::Base
  belongs_to :user
  
  validates_presence_of :name, :description, :user
end
