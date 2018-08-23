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
			render root_path
		end
	end
		
	def show
		@lesson = Lesson.find_by(id: params[:id])
		@lesson_word = @lesson.lesson_words
		@true = @lesson.word_answers.where(correct: "true")
		@count = @lesson.words
	end

end
