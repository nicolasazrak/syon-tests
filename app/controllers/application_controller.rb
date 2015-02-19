class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :require_login

  protected
  
  def require_login
  	if not is_logged
  		redirect_to login_path
  	else
  		@user = get_user
  	end
  end

  def is_logged
  	not cookies[:current_user_id].blank?
  end

  def get_user
  	if is_logged
  		User.new
  	end
  end


end
