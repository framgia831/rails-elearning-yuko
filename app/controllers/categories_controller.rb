class CategoriesController < ApplicationController
	before_action :require_login
	def index
		@categories = Category.all
	end

	def new
		@category = Category.new
	end


	
	private
		def require_login
			unless logged_in?
			flash[:notice] = "Please log in"
			redirect_to(root_path) 
			end
		end
end
