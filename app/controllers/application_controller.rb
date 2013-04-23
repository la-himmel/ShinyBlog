class ApplicationController < ActionController::Base
  protect_from_forgery
  
  public 

	  def authorized
	  	User.find_by_id(session[:user_id])  	
	  end
end
