class ApplicationController < ActionController::Base
	before_action :set_current_user

	def set_current_user
		@user = User.find(session[:user_id]) if session[:user_id]
	end

end
