require "rails_helper"

describe Status, type: :model do
  it {validates_presence_of :station_id}
  it {validates_presence_of :bikes_id}
  it {validates_presence_of :docks_available}
  it {validates_presence_of :time}
end
