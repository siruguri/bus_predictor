# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Intersection.count == 0
  i = Intersection.new name: 'Chatham and Park', stop_ids: [58500, 57277], route_ids: ['NL', '18']
  i.save
end
home = Intersection.find_by(name: 'Chatham and Park')

unless Observation.count > 500
  # observe everything for an hour yesterday and an hour today
  # 1..12 per arrives_at, gaps from 1..15

  stop_ids = [['NL', '58500'], ['18', '57277']]
  t = Time.now
  times = []
  if t.day == 1
    times << t - 1.day
  end
  times << t
  
  times.each do |start_time|
    [0..59].each do |mins|
      s = start_time + mins.minutes
      
      total_preds = Random.rand(12) + 1
      total_preds.each do |pred_idx|
        chosen_stop = stop_ids[Random.rand(2)]
        o = Observation.new stop_id: chosen_stop[0], observed_at: s, arrives_at: s + (Random.rand(15) + 1).minutes,
                            route_id: chosen_stop[1]
        o.save
      end
    end
  end
end

