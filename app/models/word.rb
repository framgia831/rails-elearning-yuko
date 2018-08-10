class Word < ApplicationRecord
  belongs_to :category
  has_many :word_answers
  validates :content, {presence: true, uniqueness: true}
end
