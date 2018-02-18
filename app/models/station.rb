class Station < ApplicationRecord
  validates_presence_of :name, :lat, :long, :dock_count, :city, :installation_date
end
