class Word < ApplicationRecord
  belongs_to :category
  has_many :word_answers, dependent: :destroy
  has_many :lesson_words,dependent: :destroy
  accepts_nested_attributes_for :word_answers
  validates :content, {presence: true, uniqueness: true}

  def correct_answer
  	word_answers.find_by(correct: true)
  end
  
end
