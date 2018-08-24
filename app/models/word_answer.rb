class WordAnswer < ApplicationRecord
  belongs_to :word

  validates :content, {presence: true, uniqueness: true, length: {maximum: 30 }}

end
