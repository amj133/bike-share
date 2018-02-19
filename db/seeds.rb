# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

stations = CSV.open('db/csv/station.csv', headers: true, header_converters: :symbol)
stations.each do |row|
  Station.create(name: row[:name],
                 lat: row[:lat],
                 long: row[:long],
                 dock_count: row[:dock_count],
                 city: row[:city],
                 installation_date: row[:installation_date])
end

statuses = CSV.open('db/csv/status.csv', headers: true, header_converters: :symbol)
statuses.each do |row|
  Status.create(station_id: row[:station_id],
                bikes_available: row[:bikes_available],
                docks_available: row[:docks_available],
                time: row[:time])
end

trips = CSV.open('db/csv/trip.csv', headers: true, header_converters: :symbol)
trips.each do |row|
  Trip.create(duration: row[:duration],
              start_date: row[:start_date],
              start_station_id: row[:start_station_id],
            end_date: row[:end_date],
          end_station_id: row[:end_station_id],
              bike_id: row[:bike_id],
              subscription: row[:subscription_type],
              zipcode: row[:zip_code])
end

conditions = CSV.open('db/csv
   weather.csv', headers: true, header_converters: :symbol)
conditions.each do |row|
  Condition.create(date: row[:date],
                   max_temp_f: row[:max_temperature_f],
                   mean_temp_f: row[:mean_temperature_f],
                   min_temp_f: row[:min_temperature_f],
                   max_dewpoint_f: row[:max_dew_point_f],
                   mean_dewpoint_f: row[:mean_dew_point_f],
                   min_dewpoint_f: row[:min_dew_point_f],
                   max_humidity: row[:max_humidity],
                   mean_humidity: row[:mean_humidity],
                   min_humidity: row[:min_humidity],
                   max_sea_level_pressure_inches: row[:max_sea_level_pressure_inches],
                   mean_sea_level_pressure_inches: row[:mean_sea_level_pressure_inches],
                   min_sea_level_pressure_inches: row[:min_sea_level_pressure_inches],
                   max_visibility_miles: row[:max_visibility_miles],
                   mean_visibility_miles: row[:mean_visibility_miles],
                   min_visibility_miles: row[:min_visibility_miles],
                   max_wind_speed: row[:max_wind_speed_mph],
                   mean_wind_speed: row[:mean_wind_speed_mph],
                   max_gust_speed: row[:max_gust_speed_mph],
                   precipitation_inches: row[:precipitation_inches],
                   cloud_cover: row[:cloud_cover],
                   events: row[:events],
                   wind_dir_degrees: row[:wind_dir_degrees],
                   zipcode: row[:zip_code])
end
