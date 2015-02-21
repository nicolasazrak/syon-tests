class Answer < ActiveRecord::Base

	belongs_to :question
	belongs_to :submission


	def expired?
		#TODO
		true
	end

	def completed?
		#TODO
		false
	end


end
