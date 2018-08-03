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
end