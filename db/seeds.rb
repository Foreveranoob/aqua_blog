# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Category.destroy_all
Comment.destroy_all
Post.destroy_all

PASSWORD = '123'

categories = Category.create([
  {name: 'Science'},
  {name: 'Music'},
  {name: 'Arts'},
  {name: 'Memes'},
  {name: 'Literature'},
  {name: 'Programming'}
])
30.times do
 User.create(
   first_name: Faker::Zelda.character,
   last_name: Faker::Overwatch.hero,
   email: Faker::Internet.email,
   password: PASSWORD)
end



100.times do
  user = User.all.sample
  Post.create title: Faker::Hacker.say_something_smart,
  body:  Faker::Hipster.paragraph,
  category: categories.sample
end

posts = Post.all

posts.each do |p|
  rand(1..5).times do
    Comment.create(body: Faker::ChuckNorris.fact, post: p)
  end
end

puts Cowsay.say 'Created 100 Posts!', :stegosaurus
puts Cowsay.say "Created #{Comment.all.count} Comments! 🎩", :ghostbusters
