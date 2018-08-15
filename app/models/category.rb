class Category < ApplicationRecord
	has_many :words
	has_many :lessons
	has_many :users, through: :lessons
	validates :title, {presence: true}
	validates :description, {presence: true}
end
