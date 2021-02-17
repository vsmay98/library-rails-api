# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
authors = (1..20).map do
  Author.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
end

books = (1..20).map do
  Book.create!(
    title: Faker::Book.title,
    author: authors.sample
  )
end

users = (1..10).map do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email
  )
end

(1..50).map do
  BookCopy.create!(
    format: rand(1..3),
    published: Faker::Date.between(from: 10.years.ago, to: Date.today),
    book: books.sample,
    isbn: Faker::Number.number(13)
  )
end