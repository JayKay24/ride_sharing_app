class ApplicationController < ActionController::Base
  protected

  def authenticate_user
    if session[:user_id]
      @current_user = User.find session[:user_id]
      true
    else
      redirect_to controller: 'sessions', action: 'new'
      false
    end
  end

  def save_login_state
    if session[:user_id]
      redirect_to controller: 'sessions', action: 'home'
      false
    else
      true
    end
  end
end
