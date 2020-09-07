# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

10.times do |n|
  enum = %w[freelancer freelancer freelancer freelancer freelancer freelancer freelancer client client client client]
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  username = Faker::Internet.user_name
  status = enum[n]
  email = "example-#{n + 1}@railstutorial.org"
  password = 'password'

  User.create!(first_name: first_name,
               last_name: last_name,
               username: username,
               status: status,
               email: email,
               password: password)
end

6.times do |_n|
  title = "Web Development with #{Faker::ProgrammingLanguage.name.titleize}"
  description = Faker::Lorem.paragraph(sentence_count: 10)
  ProjectCategory.create!(title: title,
                          description: description)
end

def title(title_name, num)
  if num.even?
    "Build a #{title_name} app for my company"
  else
    "I need a #{title_name} for my site"
  end
end

50.times do |n|
  title = title(Faker::App.name.titleize, n)
  description = Faker::Lorem.paragraph(sentence_count: 100)
  budget = Faker::Number.number(digits: 4)
  owned_user_id = Faker::Number.within(range: 7..10)
  project_category_id = Faker::Number.within(range: 1..6)

  Project.create!(title: title,
                  description: description,
                  budget: budget,
                  owned_user_id: owned_user_id,
                  project_category_id: project_category_id)
end
