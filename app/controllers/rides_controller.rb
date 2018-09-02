class RidesController < ApplicationController
  def index
    @rides = Ride.all.includes(:subscriptions)
    flash[:info] = 'There are no ride offers at the moment.' if
      @rides.empty?
  end

  def edit
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
      redirect_to rides_path
    else
      flash[:error] = 'Form is invalid'
      render 'new'
    end
  end

  def update
    @ride = Ride.find(params[:id])
    if @ride.update(ride_params)
      flash[:success] = 'You successfully edited the ride offer!'
      redirect_to rides_path
    else
      flash[:error] = 'Form is invalid'
      render 'update'
    end
  end

  def destroy
    ride = Ride.find(params[:id])
    ride.destroy
    flash[:success] = 'You successfully cancelled the ride'
    redirect_to rides_path
  end

  private

  def ride_params
    params.require(:ride).permit(
      :vehicle_id, :id, :origin, :destination,
      :take_off_time, :take_off_date
    )
  end
end
