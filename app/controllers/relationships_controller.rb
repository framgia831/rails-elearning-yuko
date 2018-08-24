class RelationshipsController < ApplicationController
	before_action :require_login
	def create
		@user = User.find(params[:followed_id])
		current_user.follow(@user)
		relationship = current_user.active_relationships.find_by(followed: @user)
		relationship.activities.create(user: current_user)
		
		flash[:success] = "Following is successfully."
		redirect_to request.referrer || @user
	end

	def destroy
		@user = Relationship.find_by(id:params[:id]).followed
		current_user.unfollow(@user)	
		flash[:success] = "Unfollowing is successfully."
		redirect_to request.referrer || @user
	end

	private
		def require_login
			unless logged_in?
			flash[:notice] = "Please log in"
			redirect_to(root_path) 
			end
		end
end
