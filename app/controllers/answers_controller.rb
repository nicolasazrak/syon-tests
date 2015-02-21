class AnswersController < ApplicationController

	skip_before_filter :require_login


	def create

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
