class Admin::WordsController < ApplicationController
	before_action :require_login
	before_action :admin_user
	def index
		@category = Category.find_by(id: params[:category_id])
		@words = @category.words.all
 
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
			render "new"
		end
		
	end

	def edit
		@category = Category.find_by(id: params[:category_id])
		@word = Word.find_by(id: params[:id])
	end

	def update
		@category = Category.find_by(id: params[:category_id])
		@word = Word.find_by(id: params[:id])
		@word.assign_attributes(word_params)

		if @word.save
			flash[:notice] = "Edit is successfully."
			redirect_to admin_category_words_path
		else
			render "edit"
		end
	end

	def destroy
		@word = Word.find_by(id: params[:id]).destroy
		if @word.destroy
			flash[:notice] = "Removing is successfully."
			redirect_to admin_category_words_path
		end
	end


	private

	def word_params
		params.require(:word).permit(:content, word_answers_attributes: [:id, :content, :correct])
	end


end
