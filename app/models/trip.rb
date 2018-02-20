class Trip < ApplicationRecord
  validates_presence_of :duration, :start_date, :start_station_id, :end_date,
                        :end_station_id, :bike_id, :subscription, :zipcode

  belongs_to :start_station, class_name: 'Station', foreign_key: 'start_station_id'

  belongs_to :end_station, class_name: 'Station', foreign_key: 'end_station_id'

  belongs_to :condition, class_name: 'Condition', foreign_key: 'start_date', primary_key: 'date'
end
