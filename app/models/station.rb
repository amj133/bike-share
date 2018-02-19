class Station < ApplicationRecord
  validates_presence_of :name, :lat, :long, :dock_count, :city, :installation_date
  has_many :started_trips, class_name: 'Trip', foreign_key: 'start_station_id'
  has_many :ended_trips, class_name: 'Trip', foreign_key: 'end_station_id'
  has_many :statuses

  def self.avg_bikes_per_station
    average(:dock_count)
  end

  def self.most_bikes_avilable
    order(dock_count: :desc).limit(1).first
  end
end
