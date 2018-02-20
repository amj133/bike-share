class Admin::TripsController < Admin::BaseController

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    flash.notice = "Trip deleted."
    redirect_to trips_path
  end





end
