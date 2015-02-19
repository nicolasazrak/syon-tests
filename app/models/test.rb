class Test < ActiveRecord::Base

	has_many :applicants, through: :submission
	has_many :submissions, counter_cache: true
	has_many :questions


end
