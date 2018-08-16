class LessonWordsController < ApplicationController
	def new
		@lesson = Lesson.find(params[:lesson_id])
		@category = @lesson.category
		@word = (@category.words - @lesson.words).first


	end

	def create
		@lesson = Lesson.find(params[:lesson_id])
		@category = @lesson.category
		@word_answer = WordAnswer.find(params[:word_answer_id])
		@word = Word.find(params[:word_id])
		@lesson_word = @lesson.lesson_words.build(word: @word, word_answer: @word_answer)

		if @lesson_word.save
			@next_word = (@category.words - @lesson.words) 

			if @next_word.any?			
				redirect_to new_lesson_lesson_word_path(@lesson)
			else
				redirect_to lesson_path(@lesson)
			end

		end
	end

	def show
		@lesson = Lesson.find_by(id: params[:lesson_id])
		@lesson_words = @lesson.lesson_words.all
	end
end
