class User < ActiveRecord::Base
	has_many :clucks

	# has_many :clucks, inverse_of: :user

	validates :password, presence: true

	validates :last_name, presence: true

	validates :first_name, presence: true

	validates :email, presence: true

end
