class SimpleMailer < ActionMailer::Base
  default from: "from@example.com"

  ActionMailer::Base.delivery_method = :sendmail

	def welcome_email(user)
	  	@user = user
	  	@url = 'http://localhost:5000/'
	  	mail(to:@user.email, subject:'Welcome to Clucker!')

	end

end
