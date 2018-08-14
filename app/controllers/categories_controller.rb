class CategoriesController < ApplicationController
	before_action :require_login
	def index
		@categories = Category.all
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(
			title: params[title],
			discription: params[disc]
			)
		if @category.save
			flash[:notice] = "Creating category is successfully."
			redirect_to "#"
		else
			render "#"
		end
		
	end
	
	private
		def require_login
			unless logged_in?
			flash[:notice] = "Please log in"
			redirect_to(root_path) 
			end
		end
end

