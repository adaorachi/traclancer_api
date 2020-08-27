# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |n|
  enum = %w[freelancer freelancer freelancer freelancer freelancer freelancer freelancer client client client client]
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  username = Faker::Internet.user_name
  status = enum[n]
  email = "example-#{n + 1}@railstutorial.org"
  password = 'password'

  user = User.create!(first_name: first_name,
                      last_name: last_name,
                      username: username,
                      status: status,
                      email: email,
                      password: password)
end

8.times do |_n|
  title = "Web Design with #{Faker::ProgrammingLanguage.name.titleize}"
  description = Faker::Lorem.paragraph(sentence_count: 10)
  project_cats = ProjectCategory.create!(title: title,
                                         description: description)
end

100.times do |_n|
  title = Faker::Book.title[4..50].titleize
  description = Faker::Lorem.paragraph(sentence_count: 100)
  amount = Faker::Number.number(digits: 4)
  owned_user_id = Faker::Number.within(range: 7..10)
  claimed_user_id = nil
  claimed = false
  completed = false
  attachment_url = nil
  project_category_id = Faker::Number.within(range: 1..8)

  projects = Project.create!(title: title,
                             description: description,
                             amount: amount,
                             owned_user_id: owned_user_id,
                             claimed_user_id: claimed_user_id,
                             claimed: claimed,
                             completed: completed,
                             attachment_url: attachment_url,
                             project_category_id: project_category_id)
end
