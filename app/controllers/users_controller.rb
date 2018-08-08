class UsersController < ApplicationController
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
			redirect_to login_path
		else
			@error_message = "User Name or Password is wrong."
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
			flash[:notice] = "Updating is successfully"
			redirect_to edit_user_path
		else
			render "edit"
		end

	end

end