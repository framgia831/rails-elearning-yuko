class DashboardController < ApplicationController

	def index
		@activities = Activity.all.order("created_at DESC")
	end
end
