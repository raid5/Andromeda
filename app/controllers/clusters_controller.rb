class ClustersController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :browse]
  
  def show
    @cluster = Cluster.find(params[:id])
    @posts = @cluster.posts
  end
  
  def index
    @clusters = current_user.clusters
  end
  
  def new
    @cluster = Cluster.new
  end
  
  def create
    @cluster = current_user.clusters.build(params[:cluster])
    if @cluster.save
      flash[:notice] = "The cluster was saved successfully."
      redirect_to :action => "index"
    else
      flash[:alert] = "The cluster could not be saved."
      render :action => "new"
    end
  end
  
  def browse
    @clusters = Cluster.all
  end
end
