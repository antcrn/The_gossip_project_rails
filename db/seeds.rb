# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
User.reset_pk_sequence

City.destroy_all
City.reset_pk_sequence

Gossip.destroy_all
Gossip.reset_pk_sequence

 10.times do
     City.create(name:Faker::Address.city, zip:rand(00001..99999))
 end

 30.times do 
     User.create!(first_name:Faker::Name.first_name, last_name:Faker::Name.last_name,description:Faker::Lorem.sentence(word_count: 180),email:Faker::Internet.email, age:rand(10..90), city_id:rand(1..10), username:Faker::Internet.email,password: "Ch33zy$", password_confirmation: "Ch33zy$" )
 end


60.times do
    Gossip.create!(title:Faker::Movies::HarryPotter.spell,content:Faker::Lorem.sentence(word_count: 350),user_id:rand(1..30))
end


60.times do
    Comment.create!(content:Faker::Lorem.sentence(word_count: 150),user_id:rand(1..30),gossip_id:rand(1..60))
end

