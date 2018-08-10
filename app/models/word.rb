class Word < ApplicationRecord
  belongs_to :category
  validates :content, {presence: true}
end
