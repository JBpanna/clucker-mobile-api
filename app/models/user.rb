class User < ActiveRecord::Base

	validates :password, presence: true

	validates :last_name, presence: true

	validates :first_name, presence: true

	validates :email, presence: true

end
