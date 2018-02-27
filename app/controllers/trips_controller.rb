class TripsController < ApplicationController
  before_action :require_current_user, only: [:dashboard]

  def index
   @first_trip, @last_trip = 1, 30
   if params[:first].to_i < 0 || params[:last].to_i < 0
     render file: '/errors/error'
   elsif params.include?('first') && params[:first].to_i > 0
     @first_trip, @last_trip = params[:first], params[:last]
   end
   @trips = Trip.where('id BETWEEN ? AND ?', @first_trip, @last_trip)
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def dashboard

  end

  private

  def require_current_user
    render file: '/errors/error' unless current_user
  end

end
