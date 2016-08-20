class ObservationJob < ActiveJob::Base
  def perform(reg, opts = {})
    opts[:times] ||= 0

    Rails.logger.debug ">>> #{Fetchers::AcTransit.fetch(53888)}"
    opts[:times].times.each do |idx|
      o = Observation.new observed_at: DateTime.now
      o.arrival_guesses = reg.route_ids.map do |r_id|
        {route_id: r_id, arrives_at: DateTime.now + 1.minute, guess_gap: 1}
      end
      o.save
    end
  end
end
