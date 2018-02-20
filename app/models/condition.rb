class Condition < ApplicationRecord
  validates_presence_of :date, :max_temp_f, :mean_temp_f, :min_temp_f, :mean_humidity, :mean_visibility_miles, :mean_wind_speed, :precipitation_inches

  has_many :trips, class_name: 'Trip', foreign_key: 'start_date', primary_key: 'date'

  def self.group_by_10_degree_intervals
    temp_range = 0..9
    joins(:trips).where(max_temp_f: temp_range)
  end
end
