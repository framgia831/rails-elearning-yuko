class Admin::WordsController < ApplicationController
	def index
		@category = Category.find_by(id: params[:category_id])
		@words = Word.all
	end

	def new
		@word = Word.new
	end

	def create
		@category = Category.find_by(id: params[:category_id])
		@word = @category.words.new(
			content: params[:content]
			)
		abort
		@word_answer = @word.word_answers.new(
			content: params[:answer]
			)
		
		if @word.save && @word_answer.save
			flash[:notice] = "Inserting is succeesfully."
			redirect_to admin_category_words_path
		else
			render("new")
		end
		
	end
end
