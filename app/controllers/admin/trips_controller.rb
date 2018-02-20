class Admin::TripsController < Admin::BaseController


  def edit
    @trip = Trip.find(params[:id])
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    flash.notice = "Trip deleted."
    redirect_to trips_path
  end


  def update
   @trip = Trip.find(params[:id])
   @trip.update(trip_params)
    if @trip.save
      redirect_to trips_path
    else
     render :edit
    end
  end

  private

  def trip_params
    params.require(:trip).permit(:duration, :start_date, :start_station_id, :end_date,
                                :end_station_id, :bike_id, :subscription, :zipcode )
  end
end
