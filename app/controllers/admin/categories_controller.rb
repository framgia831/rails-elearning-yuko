class Admin::CategoriesController < ApplicationController
	before_action :admin_user

	def index
		@categories = Category.all
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(
			title: params[:title],
			description: params[:description]
			)
		if @category.save
			flash[:notice] = "Creating category is successfully."
			redirect_to admin_categories_path
		else
			render "new"
		end	
	end

	private
		def admin_user
			redirect_to(root_path) unless current_user.admin?
		end
end
