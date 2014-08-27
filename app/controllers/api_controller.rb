require 'securerandom'
class ApiController < ApplicationController
	protect_from_forgery with: :null_session,
	if: Proc.new { |c| c.request.format =~ %r{application/json}}

def users 
    @users = User.all
    render json: @users
end

def clucks
    @clucks = Cluck.all
    render json: @clucks
end

def signUp
	first_nameServer = params[:firstSignUp]
	last_nameServer = params[:lastSignUp]
	emailServer = params[:emailSignUp]
	passwordServer = params[:passwordSignUp]


  	testlogin = {first_name: first_nameServer, last_name: last_nameServer,
            email: emailServer, password: passwordServer}
    p testlogin

		person=User.new(
 	      	first_name: first_nameServer,
 	      	last_name: last_nameServer,
 	      	email: emailServer,
 			password: passwordServer,
            api_key: SecureRandom.uuid)
 	      	person.save!

    @user_new = User.all.find_by(first_name: first_nameServer)

    session[:user] = @user_new
    session[:user_id] = @user_new.id
    @cluck_id = @user_new.id
    SimpleMailer.welcome_email(person).deliver

	render json: person
end

def logIn
	emailMemServer = params[:emailMem]
    passwordMemServer = params[:passwordMem]

    @user_login = User.all.find_by(email: emailMemServer, password: passwordMemServer)
    session[:user] = @user_login
    session[:user_id] = @user_login.id
    @cluck_id = @user_login.id


	render json: @user_login
end

def securityTest
    # if @users.api_key.nil?
        # @msg = "No secret key found"
    # end
    # session[:user_id];
    # self.api_key = session[:user].api_key
    # api_key_test = session[:api_key]
    head :ok
end

def saveCluck
    api_key = params[:apiKey]
    cluckServer = params[:cluckClient]
    
    u = User.find_by(api_key: api_key)
    if (u == nil)
        return
    end

    cluck = Cluck.new()
    cluck.text = cluckServer
    cluck.user = u

    cluck.save

    p 'Woot'

    # cluckText = Cluck.create(
    #     text: cluckServer,
    #     user_id: user.id)
    #     cluckText.save

    # p "done?"
    head :ok

end

def getCluck
    api_key = params[:apiKey]
   
   @show_cluck = Cluck.all.find_by(api_key: api_key)
   if (@show_cluck == nil)
        return
   end     


    render json: @show_cluck
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
