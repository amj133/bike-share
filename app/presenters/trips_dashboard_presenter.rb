class TripsDashboardPresenter

  def longest_trip
    Trip.longest_ride.formatted_duration
  end

  def shortest_trip
    Trip.shortest_ride.formatted_duration
  end

  def station_with_most_starts
    Trip.most_starting_station.name
  end

  def most_starts_city
    Trip.most_starting_station.city
  end

  def station_with_most_ends
    Trip.most_ending_station.name
  end

  def most_ends_city
    Trip.most_ending_station.city
  end

  def most_ridden_bike_id
    Trip.most_ridden_bike.bike_id
  end

  def highest_trip_count
    Trip.most_ridden_bike.trip_count
  end

  def least_ridden_bike_id
    Trip.least_ridden_bike.bike_id
  end

  def lowest_trip_count
    Trip.least_ridden_bike.trip_count
  end

  def most_popular_date
    Trip.most_popular_date
  end

  def least_popular_date
    Trip.least_popular_date
  end

  def avg_ride_duration
    Trip.avg_ride_duration
  end

  def longest_ride_mean_temp
    Trip.longest_ride.condition.mean_temp_f
  end

  def longest_ride_mean_wind_speed
    Trip.longest_ride.condition.mean_wind_speed
  end

  def longest_ride_mean_humidity
    Trip.longest_ride.condition.mean_humidity
  end

  def longest_ride_cloud_cover
    Trip.longest_ride.condition.cloud_cover
  end

  def shortest_ride_mean_temp
    Trip.shortest_ride.condition.mean_temp_f
  end

  def shortest_ride_mean_wind_speed
    Trip.shortest_ride.condition.mean_wind_speed
  end

  def shortest_ride_mean_humidity
    Trip.shortest_ride.condition.mean_humidity
  end

  def shortest_ride_cloud_cover
    Trip.shortest_ride.condition.cloud_cover
  end

  def month_breakdown
    Trip.month_breakdown
  end

  def subscription_count
    Trip.user_subscrip_count
  end

  def subscription_percentage
    Trip.user_subscrip_percentage
  end


end
