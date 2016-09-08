# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Intersection.count == 0
  i = Intersection.new name: 'Chatham and Park (home)'
  i.save
end
home = Intersection.find_by(name: 'Chatham and Park (home)')
r = Registration.new intersection: home, stop_ids: [58500, 57277], route_ids: ['NL', '18']
r.save
