require 'spec_helper'

describe User do
  before(:each) do
    @attr = {
      :email => 'adam@big.mac',
      :password => 'passw0rd',
      :password_confirmation => 'passw0rd'
    }
  end
  
  describe "micropost associations" do
    before(:each) do
      @user = User.create(@attr)
      @cluster1 = Factory(:cluster, :user => @user, :created_at => 1.day.ago)
      @cluster2 = Factory(:cluster, :user => @user, :created_at => 1.hour.ago)
    end

    it "has a clusters attribute" do
      @user.should respond_to(:clusters)
    end
    
    it "has the correct clusters in the right order" do
      @user.clusters.should == [@cluster2, @cluster1]
    end
    
    it "destroys associated clusters" do
      @user.destroy
      [@cluster1, @cluster2].each do |cluster|
        Cluster.find_by_id(cluster.id).should be_nil
      end
    end
  end
  
end
