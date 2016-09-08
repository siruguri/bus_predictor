class ScoreArrivalsController < ApplicationController
  def show
    @route_id = params[:route_id]
    render :show
  end

  def generate
    route_id = params[:route_id]
    
    scores = ScoreArrivalsJob.perform_now(route_id)
    points = []
    has_y = {}
    
    scores.select { |hr, hash| hash.keys.size > 0 }.keys.sort { |a, b| a <=> b}.each do |hr_key|
      (0..59).each do |min|
        x_label = "#{(hr_key - 7) % 24}:#{min}"
        if scores[hr_key].keys.include?(min)
          point = {label: x_label, y: scores[hr_key][min]*100}
        else
          # fill in the rest of the minutes
          point = {label: x_label, y: 0.0}          
        end

        points << point
      end
    end
    
    render json: points    
  end
end
