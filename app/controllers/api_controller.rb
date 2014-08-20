class ApiController < ApplicationController
	protect_from_forgery with: :null_session,
	if: Proc.new { |c| c.request.format =~ %r{application/json}}

def users 
    @users = User.all
    render json: @users
  end

def signUp
	first_nameServer = params[:firstSignUp]
	last_nameServer = params[:lastSignUp]
	emailServer = params[:emailSignUp]
	passwordServer = params[:passwordSignUp]


  	testlogin = {first_name: first_nameServer, last_name: last_nameServer,
            email: emailServer, password: passwordServer}
    p testlogin

		person=User.create(
 	      	first_name: first_nameServer,
 	      	last_name: last_nameServer,
 	      	email: emailServer,
 			password: passwordServer)
 	      	person.save

    @user_new = User.all.find_by(first_name: first_nameServer)

    session[:user] = @user_new.first_name

	head :ok
end

def logIn
	# id = params[:id]
	# first_name = params[:first_name]
	# last_name = params[:last_name]
	# email = params[:email]
	# password = params[:password]
	# p id + | + first_name + | + last_name + | 
	# 	+ email + | + password
	head :ok
end

end
