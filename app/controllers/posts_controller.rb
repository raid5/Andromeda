class PostsController < ApplicationController
  before_filter :authenticate_user!
  
  def new
    @cluster = Cluster.find(params[:cluster_id])
    @post = @cluster.posts.build
  end
  
  def create
    @cluster = Cluster.find(params[:cluster_id])
    @post = current_user.posts.build(params[:post])
    @post.cluster = @cluster
    
    if @post.save
      flash[:notice] = "The post was saved successfully."
      redirect_to cluster_path(@cluster)
    else
      flash[:alert] = "The post could not be saved."
      render :action => "new"
    end
  end
end