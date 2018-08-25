class VehiclesController < ApplicationController
  before_action :authenticate_user, only: %i[index new create]

  def index
    @vehicles = @current_user.vehicles.all
    if @vehicles.length == 0
      flash[:info] = 'You currently have no vehicles registered'
    end
  end

  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = @current_user.vehicles.create(vehicle_params)
    if @vehicle.save
      flash[:success] = 'You successfully created a vehicle!'
      redirect_to all_vehicles_path
    else
      flash[:error] = 'Form is invalid'
      render 'new'
    end
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(
      :make, :reg_no, :no_of_seats, :vehicle_type
    )
  end
end
