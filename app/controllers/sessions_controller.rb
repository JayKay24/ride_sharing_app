class SessionsController < ApplicationController
  before_action :authenticate_user, only: %i[home profile setting]
  before_action :save_login_state, only: %i[login login_attempt]

  def login
    # Login form
  end

  def login_attempt
    authorized_user = User.authenticate(params[:email], params[:login_password])
    if authorized_user
      session[:user_id] = authorized_user.id
      session[:username] = authorized_user.username
      flash[:success] = %(Wow Welcome again,
                        you logged in as
                        #{authorized_user.username})
      redirect_to all_vehicles_path
    else
      flash[:error] = 'Invalid email or password'
      render 'login'
    end
  end

  def logout
    session[:user_id] = nil
    flash[:info] = 'You were logged out'
    redirect_to new_session_path
  end

  def home
  end
end
