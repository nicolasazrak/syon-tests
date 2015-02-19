class QuestionsController < ApplicationController

	def new
		@question = Question.new
		@test = Test.find(params[:test_id])
	end

	def create
		
		@question = Question.new(params.require(:question).permit(:title, :description))
		@question.duration = params[:question][:duraction].to_i
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



end
