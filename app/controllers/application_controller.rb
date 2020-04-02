class ApplicationController < ActionController::Base
  # Modules
  include RedirectionHandler

  # Add flash types for notifications
  add_flash_types :success, :info, :warning, :error, :alert, :notice

  # Turn on request forgery protection
  protect_from_forgery with: :exception
    
  helper_method :current_user

  protected
    
  # verify whether a session exits for a user
  def authenticate
    unless current_user
      redirect_to login_path, alert: 'You need to sign in or sign up before continuing.'
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
