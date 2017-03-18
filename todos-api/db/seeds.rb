# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


15.times do |i|
  Todo.create!(title: i, created_by: 'hiep')
end

15.times do |i|
  Book.create!(code: i, password: i.to_s)
end

10.times do |i|
  Key.create!(code: i + 10, token: Digest::MD5.hexdigest(i.to_s), status: 'pending')
end

