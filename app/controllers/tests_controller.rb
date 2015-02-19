class TestsController < ApplicationController

	def index
		@tests = Test.order(updated_at: :desc)
	end

	def new
		@test = Test.new
	end

	def show
		@test = Test.find(params[:id])
	end


	def create
		@test = Test.new(test_params)
		@test.save
		redirect_to test_submissions_path(@test)
	end


	private
	def test_params
		params.require(:test).permit(:description)
	end


end
