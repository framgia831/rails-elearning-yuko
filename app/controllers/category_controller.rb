class CategoryController < ApplicationController
	def index
		@categories = Category.All
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
end
