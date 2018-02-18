class Station < ApplicationRecord
  validates_presence_of :name, :lat, :long, :dock_count, :city, :installation_date
  has_many :started_trips, class_name: 'Trip', foreign_key: 'start_station_id'
  has_many :ended_trips, class_name: 'Trip', foreign_key: 'end_station_id'
end
