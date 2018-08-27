class SubscriptionsController < ApplicationController
  before_action :authenticate_user, only: %i[index create update destroy]

  def index
    @rides = @current_user.rides
    if @rides.count == 0
      flash[:info] = 'You currently have no ride subscriptions'
    end
  end

  def create
    ride = Ride.find(params[:ride_id])
    vehicle = Vehicle.find(ride.vehicle_id)
    if @current_user.id == vehicle.user_id
      flash[:error] = 'You cannot subscribe to a ride you have created.'
      redirect_to all_rides_path
    elseif
    
    else
      if @current_user.rides.include?(ride)
        flash[:info] = 'You have already subscribed to this ride'
        redirect_to all_rides_path
      else
        @current_user.rides << ride
        ride.update(remaining_seats: ride.remaining_seats - 1)
        flash[:success] = "You successfully subscribed to a ride on #{vehicle.make} #{vehicle.reg_no}"
        redirect_to my_subscriptions_path
      end
    end
  end

  def update
  end

  def destroy
    ride = Ride.find(params[:ride_id])
    subscription = @current_user.subscriptions.find_by(
      ride_id: params[:ride_id]
    )
    subscription.destroy
    ride.update(remaining_seats: ride.remaining_seats + 1)
    flash[:success] = 'You successfully unsubscribed from this ride'
    redirect_to my_subscriptions_path
  end
end
