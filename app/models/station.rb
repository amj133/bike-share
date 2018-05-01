class Station < ApplicationRecord
  before_save :generate_slug
  validates_presence_of :name, :lat, :long, :dock_count, :city, :installation_date
  has_many :started_trips, class_name: 'Trip', foreign_key: 'start_station_id'
  has_many :ended_trips, class_name: 'Trip', foreign_key: 'end_station_id'
  has_many :statuses

  def generate_slug
    self.slug = name.parameterize
  end

  def readable_install_date
    installation_date.strftime("%b %d, %Y")
  end

  def self.avg_bikes_per_station
    average(:dock_count).round
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
    started_trips.count
  end

  def rides_ended_count
    ended_trips.count
  end

  def most_popular_destination_station_id
    started_trips
      .select("trips.end_station_id, COUNT(*) AS trip_count")
      .group(:end_station_id)
      .order("trip_count DESC")
      .first.end_station_id
  end

  def most_popular_origination_station_id
    ended_trips
      .select("trips.start_station_id, COUNT(*) AS trip_count")
      .group(:start_station_id)
      .order("trip_count DESC")
      .first.start_station_id
  end

  def date_with_highest_trips_started
    started_trips
      .select("trips.start_date, COUNT(*) AS trip_count")
      .group("trips.start_date")
      .order("trip_count DESC")
      .first.start_date.strftime("%-m/%-d/%Y")
  end

  def most_frequent_zipcode
    started_trips
      .select("zipcode, COUNT(*) AS trip_count")
      .group("zipcode")
      .order("trip_count DESC")
      .first.zipcode
  end

  def most_frequent_bike_id
    started_trips
      .select("bike_id, COUNT(*) AS trip_count")
      .group("bike_id")
      .order("trip_count DESC")
      .first.bike_id
  end
end
