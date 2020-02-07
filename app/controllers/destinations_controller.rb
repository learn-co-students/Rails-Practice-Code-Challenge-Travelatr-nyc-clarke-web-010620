class DestinationsController < ApplicationController

  before_action :find_destinations, only: [:show,:edit,:update,:destroy]
  
  def index
  @destinations = Destination.all.order(:name)
  end
  
  def show
  end
  
  def new
    @destination = Destination.new
  end
  
  def create
    @destination = Destination.create(strong_params)

    redirect_to destination_path(@destinatiom)
  end
  
  def edit
  end
  
  def update
    @destination = Destination.update(strong_params)

    redirect_to destination_path(@destinatiom)
  end
  
  def destroy
    @destination.destroy

    redirect_to destination_path
  end
  
  private 
  
  def find_destinations
    @destination = Destination.find(params[:id])
  end 
  
  
  def post_destinations
    params.require(:destination).permit(:name,:country)
  end
  
end
  
  