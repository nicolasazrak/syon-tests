class SubmissionsController < ApplicationController

	skip_before_filter :require_login, :only => [:show]

	def index
		@submissions = Submission.where(test_id: params[:test_id]).order(updated_at: :desc)
		@test = Test.find(params[:test_id])
	end

	def new
		@submission = Submission.new
		@test = Test.find(params[:test_id])
		@submission.test = @test
		@submission.applicant = Applicant.new
	end

	def show
		@submission = Submission.find_by(token: params[:id])
		@user = get_user
	end

	def create
		
		@submission = Submission.new
		@submission.token = Submission.generate_token
		@applicant = Applicant.new(params[:applicant].permit(:name, :email))
		@applicant.save
		@submission.applicant = @applicant

		@test = Test.find(params[:test_id])
		@submission.test = @test

		@submission.save

		flash[:last_token] = @submission.token
		redirect_to test_submissions_path(@test)
	end



end
