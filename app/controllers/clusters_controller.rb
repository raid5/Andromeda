class ClustersController < ApplicationController
  before_filter :authenticate_user!
  
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
end
