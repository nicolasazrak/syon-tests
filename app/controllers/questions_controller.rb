class QuestionsController < ApplicationController

	skip_before_filter :require_login, :only => [:download]


	def new
		@question = Question.new
		@test = Test.find(params[:test_id])
	end

	def create
		
		@question = Question.new(params.require(:question).permit(:title, :description))
		@question.duration = params[:question][:duration].to_i
		@test = Test.find(params[:test_id])

		uploaded_io = params[:question][:attachment]
		filename = (0...10).map { ('a'..'z').to_a[rand(26)] }.join + '_' + uploaded_io.original_filename.delete(' ')
  		
  		File.open(Rails.root.join('public', 'attachments', filename), 'wb') do |file|
    		file.write(uploaded_io.read)
    	end

    	@question.attachment = filename	

		@question.test = @test
		@question.save
		redirect_to test_submissions_path(@test)

	end


	def download

		@question = Question.find(params[:question_id])
		@submission = Submission.find_by_token(params[:submission_id])

		@answer = @submission.get_answer_for_question @question

		if @answer.nil?
			@answer = Answer.new
			@answer.question = @question
			@answer.submission = @submission
		end

		@answer.save

		send_file File.join(Rails.root, 'public', 'attachments', @question.attachment)


	end



end
