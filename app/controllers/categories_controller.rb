class CategoriesController < ApplicationController
	before_action :require_login

	def index
		@categories = Category.paginate(page: params[:page], per_page: 10)
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
