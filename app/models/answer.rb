class Answer < ActiveRecord::Base

	belongs_to :question
	belongs_to :submission


	def expired?

		if created_at.nil? or question.duration.nil?
			#It means the file was test was never downloaded
			return false
		end

		sec_diff = (Time.now - created_at).to_i.abs
		min_diff = sec_diff / 60
		
		if question.nil?
			return true
		end
			
		min_diff.to_i >= question.duration

	end

	def completed?
		not defined?(attachment) or attachment.nil?
	end

	def expiration_date
		if not created_at.nil? and not question.duration.nil?
			created_at + question.duration * 60
		end
	end

end
