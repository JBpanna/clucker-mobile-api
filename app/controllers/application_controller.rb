require 'json'
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  protect_from_forgery with: :null_session,
	if: Proc.new { |c| c.request.format =~ %r{application/json}}
	
  # skip_before_filter :verify_authenticity_token, 
 #  :if => Proc.new { |c| c.request.format == 'application/json'}

 #  def user

 #  	id = params[:id]
	# first_name = params[:first_name]
	# last_name = params[:last_name]
	# email = params[:email]
	# password = params[:password]
	# api_key = params[:api_key]
	# p id + '|' + first_name + '|' + last_name + '|' 
	# 	+ email + '|' + password + '|' + api_key
	# head :ok

 #  end

 #  def cluck

 #  	id = params[:id]
 #  	text = params[:text]
 #  	user_id = params[:user_id]
  	
 #  	head :ok
 #  end


end
