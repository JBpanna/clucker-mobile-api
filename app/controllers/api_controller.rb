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
    session[:user_id] = @user_new.id

	render json: @user_new
end

def logIn
	emailMemServer = params[:emailMem]
    passwordMemServer = params[:passwordMem]

    @user_login = User.all.find_by(email: emailMemServer, password: passwordMemServer)
    session[:user] = @user_login.first_name
    session[:user_id] = @user_login.id


	render json: @user_login
end

def logout
    reset_session
    head :ok
end  

# def index
    # session[:user_id];
    # @member = session[:user]
# end


end
