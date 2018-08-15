class User < ApplicationRecord
	has_many :lessons
	has_many :categories, through: :lessons
	validates :name, {presence: true}
	validates :email, {presence: true, uniqueness: true}
	has_secure_password
end
