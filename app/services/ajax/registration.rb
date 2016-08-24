module Ajax
  class Registration
    def self.run_ajax_action(action, *args)
      args.flatten!
      struct = {status: false}
      
      case action
      when 'toggle_state'
        if args.size >= 2
          id = args[0]
          current_state = args[1]
          if r = ::Registration.find_by(id: id)
            case current_state
            when 'off'
              r.is_on = true
            when 'on'
              r.is_on = false
            end
            r.save

            if r.is_on
              # 2 hours
              ObservationJob.perform_later(r, times: 120)              
            end
            
            struct[:status] = true
            struct[:data] = {new_state: r.is_on ? 'on' : 'off'}
          end
        end
      end
      
      struct
    end
  end
end
