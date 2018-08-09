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
			discription: params[:disc]
			)
		if @category.save
			flash[:notice] = "Creating category is successfully."
			redirect_to "#"
		else
			render "#"
		end	
	end

	private
		def admin_user

			redirect_to(root_path) unless current_user.admin?
		end
end
