class Trip < ApplicationRecord
  validates_presence_of :duration, :start_date, :start_station_id, :end_date,
                        :end_station_id, :bike_id, :subscription, :zipcode
  belongs_to :start_station, class_name: 'Station', foreign_key: 'start_station_id'
  belongs_to :end_station, class_name: 'Station', foreign_key: 'end_station_id'

  def self.avg_ride_duration
    average(:duration)
  end

  def self.longest_ride
    order('duration DESC').first.duration
  end

  def self.shortest_ride
    order(:duration).first.duration
  end

  def self.most_starting_station
    select('start_station_id, COUNT(trips) AS trip_count')
      .group(:start_station_id)
      .order('trip_count')
      .last.start_station
  end

  def self.most_ending_station
    select('end_station_id, COUNT(trips) AS trip_count')
      .group(:end_station_id)
      .order('trip_count')
      .last.end_station
  end

  # def month_breakdown
  #
  # end

  def self.most_ridden_bike
    select('bike_id, COUNT(trips) AS trip_count')
      .group(:bike_id)
      .order('trip_count')
      .last
  end

  def self.least_ridden_bike
    select('bike_id, COUNT(trips) AS trip_count')
      .group(:bike_id)
      .order('trip_count')
      .first
  end

  def self.user_subscrip_count
    group(:subscription).count
  end

  def self.user_subscrip_percentage
    user_subscrip_count.transform_values do |count|
      count / Trip.count.to_f
    end
  end

  def self.most_popular_date
    select('start_date, COUNT(*) as rides_per_date')
      .group(:start_date)
      .order('rides_per_date DESC')
      .first
      .start_date
  end

  def self.least_popular_date
    select('start_date, COUNT(*) as rides_per_date')
      .group(:start_date)
      .order('rides_per_date')
      .first
      .start_date
  end

end
