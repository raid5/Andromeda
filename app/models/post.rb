class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :cluster
  
  validates_presence_of :url, :title, :description
end
