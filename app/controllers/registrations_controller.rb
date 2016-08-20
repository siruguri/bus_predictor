class RegistrationsController < ApplicationController
  def index
    @registrations = Registration.all
    render :index
  end
end
