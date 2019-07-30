class LocationsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
  	@vehicle = Vehicle.find_by!(unique_id: params[:vehicle_id])
    @locations = @vehicle.locations.order("at")  
  	render json: @locations
  end

  def create
    @vehicle = Vehicle.find_by!(unique_id: params[:vehicle_id])
    @location = @vehicle.locations.new(location_params)    

    respond_to do |format|
      if @location.save
        format.html 
      else
        format.html 
      end
    end
  end

  private

    def location_params
      params.require(:location).permit(:lat, :lng, :at, :vehicle_id)
    end
end
