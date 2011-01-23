class ClustersController < ApplicationController
  def index
  end
  
  def new
    @cluster = Cluster.new
  end
  
  def create
    @cluster = Cluster.new(params[:cluster])
    @cluster.user = current_user
    if @cluster.save
      flash[:notice] = "The cluster was saved successfully."
      redirect_to :action => "index"
    else
      flash[:alert] = "The cluster could not be saved."
      render :action => "new"
    end
  end
end
