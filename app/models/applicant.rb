class Applicant < ActiveRecord::Base

	has_many :tests, through: :submission
	has_many :submissions
	

end
