require 'spec_helper'

describe Post do
  before(:each) do
    @user = Factory(:user)
    @cluster = Factory(:cluster, :user => @user)
    @attr = {
      :url => 'http://awesomepost.com',
      :title => "A post", 
      :description => "Post of awesome"
    }
    @post = @user.posts.build(@attr)
    @post.cluster = @cluster
    @post.save!
  end
  
  it "is valid with valid attributes" do
    @post.should be_valid
  end
  
  describe "validations" do
    it "requires a url" do
      @post.url = nil
      @post.should_not be_valid
    end
    
    it "requires a title" do
      @post.title = nil
      @post.should_not be_valid
    end

    it "requires a description" do
      @post.description = nil
      @post.should_not be_valid
    end
  end
  
  describe "user assocations" do
    it "has a user attribute" do
      @post.should respond_to(:user)
    end
    
    it "has the right associated user" do
      @post.user_id.should == @user.id
      @post.user.should == @user
    end
  end
  
  describe "cluster assocations" do
    it "has a cluster attribute" do
      @post.should respond_to(:cluster)
    end
    
    it "has the right associated cluster" do
      @post.cluster_id.should == @cluster.id
      @post.cluster.should == @cluster
    end
  end
end
