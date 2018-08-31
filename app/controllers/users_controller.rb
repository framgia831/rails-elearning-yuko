class UsersController < ApplicationController
	before_action :require_login, only: [:index, :show, :edit, :update]
	before_action :correct_user, only: [:edit, :update]

  def index
  	@users = User.paginate(page: params[:page], per_page: 5)
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(
  		name: params[:name],
  		email: params[:email], 
  		password: params[:password]
  		)

		if @user.save
			flash[:notice] = "Signup is successfully." 
			redirect_to signup_path 
		else
			render "new"
	  end
	end

	def login_form

	end

	def login
		@user = User.find_by(email: params[:email])
		if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
			flash[:notice] = "Login is successfully."
			redirect_to dashboard_index_path
		else
			@error_message = "Email or Password is wrong."
			@email = params[:email]
			@password = params[:password]
			render "login_form"
		end
	end

	def logout
		session[:user_id] = nil
		flash[:notice] = "Logout is successfully"
		redirect_to root_path
	end

	def show
		@user = User.find_by(id: params[:id])
		@activities = @user.activities.order("created_at DESC")
	end

	def edit
		@user = User.find_by(id: params[:id])
	end

	def update
		@user = User.find_by(id: params[:id])
		@user.assign_attributes(
			name: params[:name],
			email: params[:email],
			password: params[:password]
		)
		if @user.save
			flash[:notice] = "Updating is successfully."
			redirect_to edit_user_path
		else
			render "edit"
		end

	end

	def following
		@title = "Following"
		@user = User.find(params[:id])
		@users = @user.following
		@text = "#{@user.name} don't follow anyone."
		render 'show_follow'
	end

	def followers
		@title = "Followers"
		@user = User.find(params[:id])
		@users = @user.followers
		@text = "#{@user.name} don't have any follower."
		render 'show_follow'
	end

	private
		def correct_user
	      @user = User.find(params[:id])
	      redirect_to(root_url) unless @user == current_user
	    end

end