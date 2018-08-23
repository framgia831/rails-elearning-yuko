class RelationshipsController < ApplicationController

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

end
