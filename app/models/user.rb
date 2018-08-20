class User < ApplicationRecord
	has_many :lessons
	has_many :categories, through: :lessons
	has_many :active_relationships, class_name: "Relationship",
				foreign_key: "follower_id",
				dependent: :destroy
	has_many :passive_relationships, class_name: "Relationship",
			  foreign_key: "followed_id",
			  dependent: :destroy
	has_many :following, through: :active_relationships, source: :followed
	has_many :followers, through: :passive_relationships
	has_many :lessons
	has_many :lesson_words, through: :lessons


	validates :name, {presence: true}
	validates :email, {presence: true, uniqueness: true}
	has_secure_password


	def follow (other_user)
		active_relationships.create(followed_id: other_user.id)
	end

	def unfollow(other_user)
		active_relationships.find_by(followed_id: other_user.id).destroy
	end

	def following?(other_user)
		following.include?(other_user)
	end

end
