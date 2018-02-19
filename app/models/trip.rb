class Trip < ApplicationRecord
  validates_presence_of :duration, :start_date, :start_station_id, :end_date,
                        :end_station_id, :bike_id, :subscription, :zipcode
  belongs_to :start_station, class_name: 'Station', foreign_key: 'start_station_id'
  belongs_to :end_station, class_name: 'Station', foreign_key: 'end_station_id'

  def self.avg_ride_duration
    average(:duration)
  end

  # def self.longest_ride
  #
  # end
  #
  # def self.shortest_ride
  #
  # end
  #
  # def most_starting_station
  #
  # end
  #
  # def most_ending_station
  #
  # end
  #
  # def month_breakdown
  #
  # end
  #
  # def self.most_ridden_bike
  #
  # end
  #
  # def self.least_ridden_bike
  #
  # end
  #
  # def self.user_subscrip_count
  #
  # end
  #
  # def self.user_subscrip_percentage
  #
  # end
  #
  # def self.most_popular_date
  #
  # end
  #
  # def self.least_popular_date
  #
  # end
end
