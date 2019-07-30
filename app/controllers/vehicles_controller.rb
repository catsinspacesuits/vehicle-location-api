class VehiclesController < ApplicationController
   skip_before_action :verify_authenticity_token

  def index
    @vehicles = Vehicle.all
    render json: @vehicles
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)

    respond_to do |format|
      if @vehicle.save
        format.html 
      else
        format.html 
      end
    end
  end

  def destroy
    @vehicle.destroy(vehicle_params)
    respond_to do |format|
      format.html
    end
  end

  private

    def vehicle_params
      # swap id column value with unique_id to avoid conflict with primary key
      params[:vehicle][:unique_id] = params[:vehicle].delete(:id)
      params.require(:vehicle).permit(:unique_id)
    end
end