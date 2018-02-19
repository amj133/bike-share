class TripsController < ApplicationController
  def index
   if !params.include?('first')
     @first_trip, @last_trip = 1, 30
   else
     @first_trip, @last_trip = params[:first], params[:last]
   end
   @trips = Trip.where('id BETWEEN ? AND ?', @first_trip, @last_trip)
  end

  def show
    @trip = Trip.find(params[:id])
  end
  
end
