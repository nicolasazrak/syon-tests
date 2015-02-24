require 'digest/sha1'

class User < ActiveRecord::Base

	def self.authenticate(email, password)
		password = Digest::SHA1.hexdigest(password)
		User.where(email: email).where(password: password).take
	end


end
