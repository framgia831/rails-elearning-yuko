class ApplicationController < ActionController::Base
	include UsersHelper

	private
		def require_login
			unless logged_in?
			flash[:notice] = "Please log in"
			redirect_to(root_path) 
			end
		end

		def admin_user
			unless current_user.admin?
			redirect_to(root_path) 
			end
		end
	
end
