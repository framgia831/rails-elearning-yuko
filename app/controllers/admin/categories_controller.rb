class Admin::CategoriesController < ApplicationController
	before_action :require_login
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

	def edit
		@category = Category.find_by(id: params[:id])		
	end

	def update
		@category = Category.find_by(id: params[:id])
		@category.assign_attributes(
			title: params[:title],
			description: params[:description]
		)
		if @category.save
			flash[:notice] = "Edit is successfully."
			redirect_to admin_categories_path
		else
			render "edit"
		end
	end

	def destroy
		@category = Category.find_by(id: params[:id]).destroy
		if @category.destroy
			flash[:notice] = "Removing is successfully."
			redirect_to admin_categories_path
		end
	end

	private
		def admin_user
			unless current_user.admin?
			redirect_to(root_path) 
			end
		end
end
