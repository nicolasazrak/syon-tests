class Submission < ActiveRecord::Base

	belongs_to :applicant
	belongs_to :test

	def self.generate_token
		(0...9).map { ('a'..'z').to_a[rand(26)] }.join
	end


end
