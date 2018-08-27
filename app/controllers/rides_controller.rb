class RidesController < ApplicationController
  before_action :authenticate_user, only: %i[
    index show new create update destroy
  ]

  def index
    @rides = Ride.all
    if @rides.count == 0
      flash[:info] = 'There are no ride offers at the moment.'
    end
  end

  def show
    @ride = Ride.find(params[:id])
    render 'update'
  end

  def new
    @ride = Ride.new
    @vehicle_id = params[:vehicle_id]
  end

  def create
    vehicle = @current_user.vehicles.find(ride_params[:vehicle_id])
    @ride = vehicle.rides.new(ride_params)
    @ride.remaining_seats = vehicle.no_of_seats
    if @ride.save
      flash[:success] = 'You successfully created a ride!'
      redirect_to all_rides_path
    else
      flash[:error] = 'Form is invalid'
      render 'new'
    end
  end

  def update
    @ride = Ride.find(ride_params[:id])
    @ride.update(ride_params)
    if @ride.save
      flash[:success] = 'You successfully edited the ride offer!'
      redirect_to all_rides_path
    else
      flash[:error] = 'Form is invalid'
      render 'update'
    end
  end

  def destroy
    ride = Ride.find(params[:id])
    ride.destroy
    flash[:success] = 'You successfully cancelled the ride'
    redirect_to all_rides_path
  end

  private

  def ride_params
    params.require(:ride).permit(
      :vehicle_id, :id, :origin, :destination,
      :take_off_time, :take_off_date
    )
  end
end
