class Admin::TripsController < Admin::BaseController

  def new
    @trip = Trip.new
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def destroy
    @trip = Trip.find(params[:id])
    flash.notice = "Trip #{@trip.id} deleted."
    @trip.destroy
    redirect_to trips_path
  end

  def create
    @trip = Trip.new(trip_params)
    if @trip.save
     flash.notice = "Trip #{@trip.id} created."
      redirect_to trip_path(@trip)
    else
      render :new
    end
  end

  def update
   @trip = Trip.find(params[:id])
   @trip.update(trip_params)
    if @trip.save
      redirect_to trip_path(@trip)
    else
     render :edit
    end
  end

  private

  def trip_params
    params.require(:trip).permit(:id, :duration, :start_date, :start_station_id, :end_date,
                                :end_station_id, :bike_id, :subscription, :zipcode )
  end
end
