# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

puts " Clearing..."
Attendance.destroy_all
Event.destroy_all
User.destroy_all

puts " Creating Events"
30.times do
    Event.create(start_date: (DateTime.now + rand(100000..200000)), duration: rand(60..6000), title: Faker::TvShows::RuPaul.queen, description: Faker::Markdown.emphasis, price: rand(10..30), location: Faker::Locations::Australia.location)
end

puts " Creating Users"
10.times do
    the_name = Faker::Name.name
    User.create(first_name: the_name.split[0], last_name: the_name.split[1], description: Faker::Markdown.emphasis, email: "#{the_name.split.join}@yopmail.com", password: "coolos")
end

puts " Creating Attendances"
50.times do
    Attendance.create(user_id: rand((User.first.id)..(User.last.id)), event_id: rand((Event.first.id)..(Event.last.id)), stripe_customer_id: rand(81274681273..812746812732))
end