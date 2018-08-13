class Word < ApplicationRecord
  belongs_to :category
  has_many :word_answers, dependent: :destroy
  accepts_nested_attributes_for :word_answers
  validates :content, {presence: true, uniqueness: true}
end
