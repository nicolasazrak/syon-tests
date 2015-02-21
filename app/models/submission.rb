class Submission < ActiveRecord::Base

	belongs_to :applicant
	belongs_to :test

	has_many :answers

	def self.generate_token
		(0...9).map { ('a'..'z').to_a[rand(26)] }.join
	end

	def get_answer_for_question question 
		answers.find{ |a| a.question == question }
	end

end
