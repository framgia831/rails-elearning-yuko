class DashboardController < ApplicationController
	before_action :require_login

	def index
		@activities = Activity.all.order("created_at DESC")
	end


	private
		def require_login
			unless logged_in?
			flash[:notice] = "Please log in"
			redirect_to(root_path) 
			end
		end
end