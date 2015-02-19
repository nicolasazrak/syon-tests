class Answer < ActiveRecord::Base

	has_one :question
	belongs_to :submission


	def expired?
		#TODO
		false
	end

	def completed?
		#TODO
		false
	end


end
