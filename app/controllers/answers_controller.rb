class AnswersController < ApplicationController

	skip_before_filter :require_login


	def create

		@submission = Submission.find_by_token(params[:submission_id])
		@test = @submission.test

		@question = Question.find(params[:question_id])

	
		@answer = @submission.get_answer_for_question @question

		if @answer.nil?
			@answer = Answer.new
			@answer.submission = @submission
			@answer.question = @question
		end

		if not @answer.nil? and not @answer.expired?
			
			uploaded_io = params[:attachment]
			filename = (0...10).map { ('a'..'z').to_a[rand(26)] }.join + '_' + uploaded_io.original_filename.delete(' ')

	  		File.open(Rails.root.join('public', 'attachments', filename), 'wb') do |file|
	    		file.write(uploaded_io.read)
	    	end

	    	@answer.attachment = filename
	    	@answer.save

		end


		redirect_to test_submission_path @test, @submission.token

	end



end
