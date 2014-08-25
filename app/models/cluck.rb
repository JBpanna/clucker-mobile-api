class Cluck < ActiveRecord::Base
	belongs_to :user

	# validates :user, presence: true

	# validates :api_key, presence: true

	validates :text, presence: true


end
