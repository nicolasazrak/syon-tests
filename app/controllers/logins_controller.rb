class LoginsController < ApplicationController

	skip_before_filter :require_login
	layout "login"

	def index

	end

	def logout
		cookies.delete(:current_user_id)
		redirect_to login_path
	end

	def create

		@user = User.authenticate(params[:email], params[:password])

		if not @user.nil?
			cookies[:current_user_id] = @user.id
			redirect_to tests_path
		else
			flash[:invalid_user] = true
			redirect_to login_path
		end
		
	end


end
