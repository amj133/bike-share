class Admin::StationsController < Admin::BaseController

  def destroy
    @station = Station.find(params[:id])
    @station.destroy
    flash.notice = "Station #{@station.name} deleted."
    redirect_to stations_path
  end

end
