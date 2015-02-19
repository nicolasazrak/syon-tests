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
		cookies[:current_user_id] = 1
		redirect_to tests_path
	end


end
