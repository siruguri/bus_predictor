class ObservationsController < ApplicationController
  def index
    @observations = Observation.order('arrives_at asc, observed_at asc').all
    render :index
  end
end
