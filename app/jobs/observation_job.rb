class ObservationJob < ActiveJob::Base
  def perform(reg, opts = {})
    opts[:times] ||= 3
    opts[:wait_gap] ||= 60
    
    opts[:times].times.each do |idx|
      if Registration.find(id: reg.id).is_on?
        reg.stop_ids.each do |stop_id|
          # The fetcher returns a hash keyed to route names, with the TTA in minutes as a list for each route
          departures = Fetchers::AcTransit.fetch stop_id
          
          reg.route_ids.map do |r_id|
            if arr_list = departures.select { |key, list| key == r_id }.first&.last
              now = Time.now
              now_to_minute_string = now.strftime '%Y-%m-%d:%H-%M'
              now_epoch = now.to_i
              
              arr_list.each do |arrival_gap|
                o = Observation.new observed_at: (Time.new(now.year, now.month, now.day, now.hour, now.min))
                
                gap = arrival_gap.to_i
                o.route_id = r_id
                o.stop_id = stop_id
                
                a = now + gap.minutes
                o.arrives_at = Time.new a.year, a.month, a.day, a.hour, a.min
                o.gap = gap
                o.save
              end
            end
          end
        end

        Rails.logger.debug("Try #{idx}")
        # Wait for a minute for the next observation
        sleep opts[:wait_gap]
      else
        break
      end
    end
    reg.is_on = false
    reg.save
  end
end
