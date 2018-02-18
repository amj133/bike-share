class CreateConditions < ActiveRecord::Migration[5.1]
  def change
    create_table :conditions do |t|
      t.datetime :date
      t.float :max_temp_f
      t.float :mean_temp_f
      t.float :min_temp_f
      t.float :max_dewpoint_f
      t.float :mean_dewpoint_f
      t.float :min_dewpoint_f
      t.float :max_humidity
      t.float :mean_humidity
      t.float :min_humidity
      t.float :max_sea_level_pressure_inches
      t.float :mean_sea_level_pressure_inches
      t.float :min_sea_level_pressure_inches
      t.float :max_visibility_miles
      t.float :mean_visibility_miles
      t.float :min_visibility_miles
      t.float :max_wind_speed
      t.float :mean_wind_speed
      t.float :max_gust_speed
      t.float :precipitation_inches
      t.float :cloud_cover
      t.float :events
      t.float :wind_dir_degrees
      t.integer :zipcode
    end
  end
end
