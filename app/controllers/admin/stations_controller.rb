class Admin::StationsController < Admin::BaseController

  def new
    @station = Station.new
  end

  def create
    @station = Station.new(station_params)
    @station.slug=@station.name.parameterize
    if @station.save
      flash.notice = "New station created."
      redirect_to station_path(@station.slug)
    else
      render :new
    end
  end

  def edit
    @station = Station.find_by(slug: params[:slug])
  end

  def update
    @station = Station.find(params[:slug])
    @station.update(station_params)
      if @station.save
        redirect_to station_path(@station.slug)
      else
        render :edit
      end
  end

  def destroy
    @station = Station.find_by(slug: params[:slug])
    @station.destroy
    flash.notice = "Station #{@station.name} deleted."
    redirect_to stations_path
  end

  private

  def station_params
    params.require(:station).permit(:name, :lat, :long, :dock_count, :city, :installation_date, :slug)
  end

end
