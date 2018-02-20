class Station < ApplicationRecord
  validates_presence_of :name, :lat, :long, :dock_count, :city, :installation_date
  has_many :started_trips, class_name: 'Trip', foreign_key: 'start_station_id'
  has_many :ended_trips, class_name: 'Trip', foreign_key: 'end_station_id'
  has_many :statuses

  def self.avg_bikes_per_station
    average(:dock_count)
  end

  def self.most_bikes_available
    order(dock_count: :desc).limit(1).first
  end

  def self.fewest_bikes_available
    order(:dock_count).limit(1).first
  end

  def self.most_recently_installed
    order("date(installation_date)").last
  end

  def self.oldest_station
    order("date(installation_date)").first
  end

  def rides_started_count
    Station.joins("INNER JOIN trips ON stations.id = trips.start_station_id")
           .where("stations.id = #{self.id}")
           .count
  end

  def rides_ended_count
    Station.joins("INNER JOIN trips ON stations.id = trips.end_station_id")
           .where("stations.id = #{self.id}")
           .count
  end
end
