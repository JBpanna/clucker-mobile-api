require 'json'
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def user

  	id = params[:id]
	first_name = params[:first_name]
	last_name = params[:last_name]
	email = params[:email]
	password = params[:password]
	p id + '|' + first_name + '|' + last_name + '|' 
		+ email + '|' + password
	head :ok

  end

end
