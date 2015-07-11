# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

# Create Posts

25.times do
  Post.create!(
    title: Faker::Lorem.words, 
    body: Faker::Lorem.characters 
    )
         end

50.times do
  Post.create!(
    title:  Faker::Lorem.sentence,
    body:   Faker::Lorem.paragraph
    )
         end
         
         
    posts = Post.all
     
# Create Comments
75.times do
  Comment.create!(
    post: posts.sample,
    body: Faker::Lorem.characters 
    )
        end
100.times do
  Comment.create!(
    post: posts.sample,
    body: Faker::Lorem.paragraph
    )
        end
      
