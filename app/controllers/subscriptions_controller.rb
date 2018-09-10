class SubscriptionsController < ApplicationController
  def index
    @rides = @current_user.rides
    flash[:info] = 'You currently have no ride subscriptions' if
      @rides.empty?
    @subscription = Subscription.new
  end

  def create
    ride = Ride.find(subscription_params[:id])
    vehicle = Vehicle.find(ride.vehicle_id)
    @subscription = Subscription.new(user: @current_user, ride: ride)
    if @subscription.save
      flash[:success] = %(You successfully subscribed to a ride on
        #{vehicle.make} #{vehicle.reg_no})
      redirect_to subscriptions_path
    end
  end

  def destroy
    subscription = @current_user.subscriptions.find_by(
      ride_id: params[:id]
    )
    subscription.destroy
    flash[:success] = 'You successfully unsubscribed from this ride'
    redirect_to subscriptions_path
  end

  private

  def subscription_params
    params.require(:subscription).permit(:id)
  end
end
