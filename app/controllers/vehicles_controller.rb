class VehiclesController < ApplicationController
  before_action :authenticate_user, only: %i[index show new create update destroy]

  def index
    @vehicles = @current_user.vehicles.all
    if @vehicles.length == 0
      flash[:info] = 'You have no vehicles registered at the moment.'
    end
  end

  def show
    @vehicle = Vehicle.find(params[:id])
    render 'update'
  end

  def new
    @vehicle = Vehicle.new
  end

  def create
    if vehicle_params[:no_of_seats].to_i <= 0
      flash[:error] = 'You must have room for at least one passenger'
      redirect_to all_vehicles_path
    else
      @vehicle = @current_user.vehicles.create(vehicle_params)
      if @vehicle.save
        flash[:success] = 'You successfully created a vehicle!'
        redirect_to all_vehicles_path
      else
        flash[:error] = 'Form is invalid'
        render 'new'
      end
    end
  end

  def update
    if vehicle_params[:no_of_seats].to_i <= 0
      flash[:error] = 'You must have room for at least one passenger'
      redirect_to all_vehicles_path
    else
      vehicle = Vehicle.find(vehicle_params[:id])
      vehicle.update(vehicle_params)
      flash[:success] = 'You successfully updated the vehicle'
      redirect_to all_vehicles_path
    end
  end

  def destroy
    Vehicle.find(params[:id]).destroy
    flash[:success] = 'You successfully  deregistered the vehicle'
    redirect_to all_vehicles_path
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(
      :make, :reg_no, :no_of_seats, :vehicle_type, :id
    )
  end
end
