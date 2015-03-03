class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include ApplicationHelper
  helper_method :current_user

  def current_user
  	@current_user ||= session[:user] if session[:user]
  	if @current_user
  		@current_user
  	else
  		'Guest'
  	end
  end
  
end
