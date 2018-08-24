class Category < ApplicationRecord
	has_many :words, dependent: :destroy
	has_many :lessons, dependent: :destroy
	has_many :users, through: :lessons,dependent: :destroy

	validates :title, {presence: true,length: {maximum: 30 }}
	validates :description, {presence: true,length: {maximum: 50 }}
end
