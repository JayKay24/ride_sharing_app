class RidesController < ApplicationController
  before_action :authenticate_user, only: %i[
    index show new create update destroy
  ]

  def index
    @rides = Ride.all
  end

  def show
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
  end

  private

  def ride_params
    params.require(:ride).permit(
      :vehicle_id, :origin, :destination,
      :take_off_time, :take_off_date
    )
  end
end
