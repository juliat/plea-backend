class ApplicationController < ActionController::Base
  protect_from_forgery

  # check login for everything
  # before_filter :authenticate_user!

  # check authorization by default for every action
  # check_authorization
  #  If you want to skip this add skip_authorization_check to a controller subclass

  # authentication methods
  private
	  rescue_from CanCan::AccessDenied do |exception|
	    redirect_to login_url, :alert => exception.message
	  end
end
