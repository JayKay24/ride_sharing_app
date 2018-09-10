class ApplicationController < ActionController::Base
  before_action :authenticate_user, only: %i[
    home index show new create edit update destroy
  ]

  protected

  def authenticate_user
    if session[:user_id]
      @current_user = User.find session[:user_id]
    else
      redirect_to controller: 'sessions', action: 'new'
    end
  end

  def save_login_state
    if session[:user_id]
      redirect_to controller: 'vehicles', action: 'index'
    end
  end
end
