class Condition < ApplicationRecord
  validates_presence_of :date, :max_temp_f, :mean_temp_f, :min_temp_f, :mean_humidity, :mean_visibility_miles, :mean_wind_speed, :precipitation_inches
end