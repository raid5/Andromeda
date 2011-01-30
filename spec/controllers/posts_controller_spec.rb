require 'spec_helper'

describe PostsController do  
  before(:each) do
    @user = Factory(:user)
    @cluster = Factory(:cluster, :user => @user)
  end
  
  describe "access control" do
    it "denies access to new" do
      get :new, :cluster_id => @cluster
      response.should redirect_to(new_user_session_path)
    end
  end
  
  describe "GET new" do
    before(:each) do
      #user = Factory(:user)
      sign_in @user
      @post = Factory(:post, :user => @user, :cluster => @cluster)
    end
    
    it "is successful" do
      get :new, :cluster_id => @cluster
      response.should be_success
    end
    
    it "assigns the correct @post" do
      post = Post.new
      Post.stub!(:new).and_return(post)
      
      get :new, :cluster_id => @cluster
      assigns[:post].should eq(post)
    end
  end
  
  describe "POST create" do
    before(:each) do
      sign_in @user
    end
    
    describe "success" do
      before(:each) do
        @attr = { :url => 'http://testpost.com', :title => "Test post", :description => "My test post" }
      end
    
      it "creates a post" do
        lambda do
          post :create, :post => @attr, :cluster_id => @cluster
        end.should change(Post, :count).by(1)
      end
    
      it "redirect to the posts list" do
        post :create, :post => @attr, :cluster_id => @cluster
        response.should redirect_to(cluster_path(@cluster))
      end
    
      it "has a flash notice message" do
        post :create, :post => @attr, :cluster_id => @cluster
        flash[:notice].should =~ /post was saved/i
      end
    end
    
    describe "failure" do
      before(:each) do
        @attr = { :url => '', :title => "", :description => "" }
      end
      
      it "does not create a post" do
        lambda do
          post :create, :post => @attr, :cluster_id => @cluster
        end.should_not change(Post, :count)
      end
      
      it "renders the new post page" do
        post :create, :post => @attr, :cluster_id => @cluster
        response.should render_template(:new)
      end
      
      it "has a flash alert message" do
        post :create, :post => @attr, :cluster_id => @cluster
        flash[:alert].should =~ /post could not be saved/i
      end
    end
  end
end