class VehiclesController < ApplicationController
  def index
    @vehicles = @current_user.vehicles
    flash[:info] = 'You have no vehicles registered at the moment.' if
      @vehicles.empty?
  end

  def edit
    @vehicle = Vehicle.find(params[:id])
    render 'update'
  end

  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = @current_user.vehicles.create(vehicle_params)
    if @vehicle.save
      flash[:success] = 'You successfully created a vehicle!'
      redirect_to vehicles_path
    else
      flash[:error] = 'Form is invalid'
      render 'new'
    end
  end

  def update
    @vehicle = Vehicle.find(params[:id])
    if @vehicle.update(vehicle_params)
      flash[:success] = 'You successfully updated the vehicle'
      redirect_to vehicles_path
    else
      flash[:error] = 'Form is invalid'
      render 'update'
    end
  end

  def destroy
    Vehicle.find(params[:id]).destroy
    flash[:success] = 'You successfully  deregistered the vehicle'
    redirect_to vehicles_path
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(
      :make, :reg_no, :no_of_seats, :vehicle_type, :id
    )
  end
end
