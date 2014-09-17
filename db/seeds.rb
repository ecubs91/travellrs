# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.delete_all
@a = User.create!(email: 'harrylee1230@gmail.com', password: 'abcdefgh', password_confirmation: 'abcdefgh', :first_name => 'Harry', :last_name => 'Lee')
@a.save

@b = User.create!(email: 'harry.lee@oriel.ox.ac.uk', password: 'abcdefgh', password_confirmation: 'abcdefgh', :first_name => 'Josh', :last_name => 'Manson')
@b.save

@c = User.create!(email: 'ecubs91@naver.com', password: 'abcdefgh', password_confirmation: 'abcdefgh', :first_name => 'Leesu', :last_name => 'Jackson')
@c.save


Trip.delete_all
@d = Trip.create!(destination: 'Oxford', language: 'English, French', interests: 'football', user_id: 1)
@d.save
@e = Trip.create!(destination: 'Oxford', language: 'English, Chinese', interests: 'musical', user_id: 2)
@e.save
@f = Trip.create!(destination: 'Cambridge', language: 'French, Chinese', interests: 'food', user_id: 3)
@f.save
@g = Trip.create!(destination: 'Cambridge', language: 'Korean, Chinese', interests: 'nightlife', user_id: 2)
@g.save


Comment.delete_all
@x = Comment.create!(comment: 'Awesome!', user_id: 2, trip_id: 1)
@x.save
@y = Comment.create!(comment: 'Great!', user_id: 2, trip_id: 2)
@y.save

