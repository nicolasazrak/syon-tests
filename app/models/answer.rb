class Answer < ActiveRecord::Base

	belongs_to :question
	belongs_to :submission


	def expired?
		#TODO
		false
	end

	def completed?
		#TODO
		true
	end


end
