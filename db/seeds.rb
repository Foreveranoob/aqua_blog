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
  {name: 'DIY'},
  {name: 'Fish'},
  {name: 'CO2 Requirements'},
  {name: 'Lighting'},
  {name: 'Substrate'},
  {name: 'Plants'}
])

30.times do
    blog_user_image_file  = File.open(File.join(Rails.root,"app/assets/images/goofy_avatar#{rand(10)}.jpg"))

 User.create(
   first_name: Faker::Zelda.character,
   last_name: Faker::Overwatch.hero,
   email: Faker::Internet.email,
   image: blog_user_image_file,
   password: PASSWORD
 )

end

users = User.all

100.times do
  blog_post_image_file  = File.open(File.join(Rails.root,"app/assets/images/blog#{rand(11)}img.jpg"))
  Post.create(
  title: Faker::ChuckNorris.fact,
  body:  Faker::RickAndMorty.quote,
  category: categories.sample,
  user: users.sample,
  post_rating: rand(120..890),
  post_image: blog_post_image_file,
)
end

posts = Post.all

posts.each do |p|
  rand(1..5).times do
    Comment.create(body: Faker::ChuckNorris.fact, post: p, user: users.sample)
  end
end

puts Cowsay.say 'Created 100 Posts!', :stegosaurus
puts Cowsay.say "Created #{Comment.all.count} Comments! 🎩", :ghostbusters
