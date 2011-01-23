require 'spec_helper'

describe Cluster do
  before(:each) do
    @cluster = Cluster.new(
      :name => "foo name",
      :description => "bar description", 
      :user => mock_model(User)
    )
  end
  
  it "is valid with valid attributes" do
    @cluster.should be_valid
  end
  
  it "is not valid without a name" do
    @cluster.name = nil
    @cluster.should_not be_valid
  end
  
  it "is not valid without a description" do
    @cluster.description = nil
    @cluster.should_not be_valid
  end
  
  it "is not valid without a user" do
    @cluster.user = nil
    @cluster.should_not be_valid
  end
end
