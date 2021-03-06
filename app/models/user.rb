class User < ApplicationRecord
	#it tells the User model that password_digest field needs to be encrypted
	has_secure_password

	has_many :notifications

	validates_presence_of :email
	validates_uniqueness_of :email
end
