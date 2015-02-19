class Answer < ActiveRecord::Base

	has_one :question
	belongs_to :submission


end
