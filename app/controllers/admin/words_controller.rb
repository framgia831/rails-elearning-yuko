class Admin::WordsController < ApplicationController
	def index
		@category = Category.find_by(id: params[:category_id])
		@words = Word.all
	end

	def new
		@category = Category.find_by(id: params[:category_id])
		@word = @category.words.build
		3.times { @word.word_answers.build }
	end

	def create
		@category = Category.find_by(id: params[:category_id])
		@word = @category.words.build(word_params)
	
		if @word.save
			flash[:notice] = "Inserting is succeesfully."
			redirect_to admin_category_words_path
		else
			render("new")
		end
		
	end


	private

	def word_params
		params.require(:word).permit(:content, word_answers_attributes: [:content, :correct])
	end


end
