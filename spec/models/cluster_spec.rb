require 'spec_helper'

describe Cluster do
  before(:each) do
    @user = Factory(:user)
    @attr = {
      :name => "A cluster", 
      :description => "My sweet cluster of goodness"
    }
    @cluster = @user.clusters.create!(@attr)
  end
  
  it "is valid with valid attributes" do
    @cluster.should be_valid
  end
  
  describe "validations" do
    it "requires a name" do
      @cluster.name = nil
      @cluster.should_not be_valid
    end

    it "requires a description" do
      @cluster.description = nil
      @cluster.should_not be_valid
    end
  end
  
  describe "user assocations" do
    it "has a user attribute" do
      @cluster.should respond_to(:user)
    end
    
    it "has the right associated user" do
      @cluster.user_id.should == @user.id
      @cluster.user.should == @user
    end
  end
  
end
