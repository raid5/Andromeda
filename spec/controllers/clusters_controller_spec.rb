require 'spec_helper'

describe ClustersController do

  describe "access control" do
    it "denies access to create" do
      post :create
      response.should redirect_to(new_user_session_path)
    end
    
    it "denies access to index" do
      get :index
      response.should redirect_to(new_user_session_path)
    end
  end
  
  describe "GET new" do
    before(:each) do
      @user = Factory(:user)
      sign_in @user
    end
      
    it "is successful" do
      get :new
      response.should be_success
    end

    it "assigns @cluster for the view" do
      @cluster = Cluster.new
      Cluster.stub!(:new).and_return(@cluster)
      get :new
      assigns[:cluster].should eq(@cluster)
    end
  end

  describe "POST create" do
    before(:each) do
      @user = Factory(:user)
      sign_in @user
    end
    
    describe "failure" do
      before(:each) do
        @attr = { :name => "", :description => "" }
      end
      
      it "does not create a micropost" do
        lambda do
          post :create, :cluster => @attr
        end.should_not change(Cluster, :count)
      end
      
      it "renders the new cluster page" do
        post :create, :cluster => @attr
        response.should render_template(:new)
      end
      
      it "has a flash alert message" do
        post :create, :cluster => @attr
        flash[:alert].should =~ /cluster could not be saved/i
      end
    end
    
    describe "success" do
      before(:each) do
        @attr = { :name => "Test cluster", :description => "My test cluster" }
      end

      it "creates a cluster" do
        lambda do
          post :create, :cluster => @attr
        end.should change(Cluster, :count).by(1)
      end

      it "redirect to the clusters list" do
        post :create, :cluster => @attr
        response.should redirect_to(clusters_path)
      end

      it "has a flash notice message" do
        post :create, :cluster => @attr
        flash[:notice].should =~ /cluster was saved/i
      end
    end
  end
  
  describe "GET index" do
    context "with existing clusters" do
      before(:each) do
        @user = Factory(:user)
        sign_in @user

        @clusters = [Factory(:cluster, :user => @user, :created_at => 1.hour.ago),
                     Factory(:cluster, :user => @user, :created_at => 1.day.ago)]

        @user2 = Factory(:user, :email => 'hello@github.com')
        @user2_cluster = Factory(:cluster, :user => @user2)
      end

      it "assigns the correct @clusters" do
        get :index
        assigns[:clusters].should eq(@clusters)
      end
    end
    
    context "with no clusters" do
      before(:each) do
        @user = Factory(:user)
        sign_in @user
      end

      it "assigns an empty @clusters" do
        get :index
        assigns[:clusters].should be_empty
      end
    end
  end
  
end
