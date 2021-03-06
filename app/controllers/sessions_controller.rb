class SessionsController < ApplicationController
  before_action :authenticate_user, only: %i[home]
  before_action :save_login_state, only: %i[login login_attempt]

  def new
    # Login form
  end

  def create
    authorized_user = User.authenticate(
      session_params[:username_or_email], session_params[:login_password]
    )
    if authorized_user
      session[:user_id] = authorized_user.id
      session[:username] = authorized_user.username
      flash[:success] = %(Wow Welcome again,
                        you logged in as
                        #{authorized_user.username})
      redirect_to vehicles_path
    else
      flash[:error] = 'Invalid email or password'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    session[:username] = nil
    flash[:info] = 'You were logged out'
    redirect_to new_session_path
  end

  def home
  end

  private

  def session_params
    params.require(:session).permit(
      :username_or_email, :login_password
    )
  end
end
