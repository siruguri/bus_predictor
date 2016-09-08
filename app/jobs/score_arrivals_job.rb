class ScoreArrivalsJob < ActiveJob::Base
  def perform(route_id)
    # For a given set of hours (UTC 1500, to EOD, to UTC 0500)
    scores = {}
    ((15..23).to_a + (0..5).to_a).each do |hr|
      scores[hr] = {}
      # Find all unique arrives_at minutes in that hr
      obs = Observation.where({arrives_at_hour: hr}.merge(route_id.nil? ? {} : {route_id: route_id}))
      obs_minutes = obs.pluck(:arrives_at_minute).uniq

      # Score each available minute
      obs_minutes.each do |min|
        scores[hr][min] ||= 0.0
        all_mins = obs.where({arrives_at_minute: min})

        all_mins.each do |timepoint|
          # Inverse harmonic - bigger gaps count for less, linearly.
          scores[hr][min] +=  1.0/timepoint.gap
        end
      end
    end

    puts ">>> #{scores} for route #{route_id}"
    scores
  end
end
