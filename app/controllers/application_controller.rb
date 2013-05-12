class ApplicationController < ActionController::Base
  protect_from_forgery

  # check login for everything
  before_filter :authenticate_user!

  # check authorization by default for every action
  check_authorization
  #  If you want to skip this add skip_authorization_check to a controller subclass

  # authentication methods
  private
	  def current_user
	    @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
	  end
	  
	  # make current_user a helper method so that it's accessible to the views
	  helper_method :current_user
	  
	  def logged_in?
	    current_user
	  end
	  helper_method :logged_in?
	  
	  def check_login
	    redirect_to login_url, alert: "You need to log in to view this page." if current_user.nil?
	  end

	  rescue_from CanCan::AccessDenied do |exception|
	    redirect_to root_url, :alert => exception.message
	  end
end
