require 'spec_helper'

describe ClustersController do
  describe "GET new" do
    let(:cluster) { mock_model(Cluster).as_null_object }
    
    before do
      Cluster.stub(:new).and_return(cluster)
    end
    
    it "is successful" do
      get :new
      response.should be_success
    end
    
    it "creates a new cluster" do
      Cluster.should_receive(:new).and_return(cluster)
      get :new
    end
    
    it "assigns @cluster for the view" do
      Cluster.should_receive(:new).and_return(cluster)
      get :new
      assigns[:cluster].should eq(cluster)
    end
  end
  
  describe "POST create" do
    let(:cluster) { mock_model(Cluster).as_null_object }
    
    before do
      Cluster.stub(:new).and_return(cluster)
    end
    
    it "creates a new cluster" do
      Cluster.should_receive(:new).
        with("name" => "the dev cluster").
        and_return(cluster)
      post :create, :cluster => { "name" => "the dev cluster" }
    end
    
    # it "sets the current user as the cluster's user'" do
    #   pending("not sure how to do this")
    #   user = mock_model(User)
    #   post :create
    #   assigns[:cluster].user.should eq(user)
    # end
    
    it "saves the cluster" do
      cluster.should_receive(:save)
      post :create
    end
    
    context "when the cluster saves successfully" do
      before do
        cluster.stub(:save).and_return(true)
      end
      
      it "sets a flash[:notice] message" do
        post :create
        flash[:notice].should eq("The cluster was saved successfully.")
      end
      
      it "redirects to the Cluster index" do
        post :create
        response.should redirect_to(:action => "index")
      end
    end
    
    context "when the cluster fails to save" do
      before do
        cluster.stub(:save).and_return(false)
      end
      
      it "assigns @cluster" do
        post :create
        assigns[:cluster].should eq(cluster)
      end
      
      it "sets a flash[:alert] message" do
        post :create
        flash[:alert].should eq("The cluster could not be saved.")
      end
      
      it "renders the new template" do
        post :create
        response.should render_template("new")
      end
    end
  end
end
