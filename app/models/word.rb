class Word < ApplicationRecord
  belongs_to :category

  has_many :word_answers, dependent: :destroy
  has_many :lesson_words,dependent: :destroy

  accepts_nested_attributes_for :word_answers

  validates :content, {presence: true, length: {maximum: 30 }}
  validate :one_correct_answer

  def correct_answer
  	word_answers.find_by(correct: true)
  end

  private
  	def one_correct_answer
  		unless word_answers.collect {|a| a.correct}.count(true) == 1
  			errors.add(:word_answers, "should have one correct answer")
  		end
  	end
  
end
