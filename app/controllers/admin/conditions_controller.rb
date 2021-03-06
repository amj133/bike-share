class Admin::ConditionsController < Admin::BaseController

  def new
    @condition = Condition.new
  end

  def edit
    @condition = Condition.find(params[:id])
  end

  def update
   @condition = Condition.find(params[:id])
   @condition.update(condition_params)
    if @condition.save
      redirect_to condition_path(@condition)
    else
     render :edit
    end
  end

  def create
    @condition = Condition.new(condition_params)
    if @condition.save
     flash.notice = "Condition for #{@condition.date.strftime("%-m/%-d/%Y")} created."
      redirect_to condition_path(@condition)
    else
      render :new
    end
  end

  def destroy
    @condition = Condition.find(params[:id])
    flash.notice = "Condition for #{@condition.date.strftime("%-m/%-d/%Y")} deleted."
    @condition.destroy
    redirect_to conditions_path
  end

  private

  def condition_params
    params.require(:condition).permit(:date, :max_temp_f, :mean_temp_f, :min_temp_f, :max_dewpoint_f,
                                :mean_dewpoint_f, :min_dewpoint_f, :max_humidity, :mean_humidity,
                                :min_humidity, :max_sea_level_pressure_inches, :mean_sea_level_pressure_inches,
                                :min_sea_level_pressure_inches,
                                :max_visibility_miles, :mean_visibility_miles, :min_visibility_miles, :max_wind_speed,
                                :mean_wind_speed, :max_gust_speed, :precipitation_inches, :cloud_cover,
                                :events, :wind_dir_degrees, :zipcode )
  end

end
