class TripsController < ApplicationController
  def index
   @first_trip, @last_trip = 1, 30
   @trips = Trip.where('id BETWEEN ? AND ?', @first_trip, @last_trip)
  end
end
