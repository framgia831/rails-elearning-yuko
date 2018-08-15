class LessonsController < ApplicationController
	def index
	end



	def create
		@user = current_user
		@category = Category.find_by(id: params[:category_id])
		@lesson = @user.lessons.build(category: @category)

		if @lesson.save
			redirect_to new_lesson_lesson_word_path(@lesson)
		else
			render "#"
		end
	end


end
