module UsersHelper
	def current_user
		User.find_by(id: session[:user_id])
	end
	
	def gravatar_for(user, size = 150)
 		gravatar_id = Digest::MD5::hexdigest(user.email)
  		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
  		image_tag(gravatar_url)
	end
end
