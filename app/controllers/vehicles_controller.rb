class VehiclesController < ApplicationController
  before_action :authenticate_user, only: %i[index new create]

  def index
    @vehicles = @current_user.vehicles.all
    if @vehicles.length == 0
      flash[:info] = 'You have no vehicles registered at the moment.'
    end
  end

  def show
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

  def update
  end

  def destroy
    Vehicle.find(params[:vehicle_id]).destroy
    flash[:success] = 'You successfully  deregistered the vehicle'
    redirect_to all_vehicles_path
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(
      :make, :reg_no, :no_of_seats, :vehicle_type
    )
  end
end
