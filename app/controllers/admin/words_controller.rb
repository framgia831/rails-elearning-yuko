class Admin::WordsController < ApplicationController
	def index
		@category = Category.find_by(id: params[:category_id])
		@words = Word.all
	end

	def new
		@word = Word.new
		3.times { @word.word_answers.build }
	end

	def create
		@category = Category.find_by(id: params[:category_id])
		@word = @category.words.new(
			content: params[:content]
			)

		params[:word_answers].each do |word_answer|
			@word.word_answers.build(content: word_answer[:content])
		end
		# abort
		#@word_answer = @word.word_answers.new(
		#	content: params[:answer]
		#	)
		
		if @word.save
			flash[:notice] = "Inserting is succeesfully."
			redirect_to admin_category_words_path
		else
			render("new")
		end
		
	end
end
