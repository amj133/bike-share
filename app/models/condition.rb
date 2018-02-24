class Condition < ApplicationRecord
  validates_presence_of :date, :max_temp_f, :mean_temp_f, :min_temp_f, :mean_humidity, :mean_visibility_miles, :mean_wind_speed, :precipitation_inches

  has_many :trips, class_name: 'Trip', foreign_key: 'start_date', primary_key: 'date'

  def readable_date
    date.strftime("%b %d, %Y")
  end

  def self.rides_by_date(attr, min, max)
    where("#{attr} BETWEEN ? AND ?", min, max)
      .joins(:trips)
      .group('conditions.date')
      .count
  end

  def self.average_rides_per_day(attr, min, max)
    rides = rides_by_date(attr, min, max).values
    rides.sum / rides.count
  end

  def self.date_with_most_rides(attr, min, max)
    date_rides = rides_by_date(attr, min, max)
    ride_count = date_rides.values.max_by {|count| count}
    date_rides.select { |date, count| count == ride_count}
  end

  def self.date_with_least_rides(attr, min, max)
    date_rides = rides_by_date(attr, min, max)
    ride_count = date_rides.values.min_by {|count| count}
    date_rides.select { |date, count| count == ride_count}
  end

end
