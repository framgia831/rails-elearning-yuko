# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

10.times do |n| 
	category = Category.create!(title: "title#{n}",
		description: "description#{n}"
		)

	10.times do 
		word = category.words.build(
			content: Faker::Lorem.word
			)

		3.times do 
			word.word_answers.build(
				content: Faker::Lorem.word
				)
		end

		random_num = rand(0..2)
		word.word_answers[random_num].correct = true

		word.save
	end

end



User.create!(name: "yuko",
	email: "yu@gmail.com",
	password: "yuko",
	admin: true)
20.times do |n|
	name = Faker::Name.name
	email = "#{n+1}yu@railstutorial.org"
	password = "password"
	User.create!(name: name,
		email: email,
		password: password,
		password_confirmation: password)
end
