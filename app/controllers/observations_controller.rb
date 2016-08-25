class ObservationsController < ApplicationController
  around_action :set_time_zone, only: :index
  
  def index
    @observations = Observation.order('arrives_at asc, observed_at asc').all
    render :index
  end

  private
  def set_time_zone
    Time.use_zone(Time.find_zone('America/Los_Angeles')) { yield }
  end
end
