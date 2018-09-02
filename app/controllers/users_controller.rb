class UsersController < ApplicationController
  skip_before_action :authenticate_user
  before_action :save_login_state, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'You successfully signed up!'
      session[:user_id] = @user.id
      session[:username] = @user.username
      redirect_to new_vehicle_path
    else
      flash[:error] = 'Form is invalid'
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name, :last_name, :username,
      :email, :password, :password_confirmation
    )
  end
end
