require "rails_helper"

describe Station, type: :model do
  describe "validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:lat)}
    it {should validate_presence_of(:long)}
    it {should validate_presence_of(:dock_count)}
    it {should validate_presence_of(:city)}
    it {should validate_presence_of(:installation_date)}
  end

  describe "relationships" do
    it {should have_many(:started_trips)}
    it {should have_many(:ended_trips)}
    it {should have_many(:statuses)}
  end

  describe "class methods" do
    it "#avg_bikes_per_station returns proper value" do
      station_1 = Station.create!(name: "blue",
                      lat: 1,
                      long: 1,
                      dock_count: 1,
                      city: "Richmond",
                      installation_date: DateTime.now)
      station_2 = Station.create!(name: "blue",
                      lat: 1,
                      long: 1,
                      dock_count: 5,
                      city: "Richmond",
                      installation_date: DateTime.now)

      expect(Station.avg_bikes_per_station).to eq(3)
    end

    it "#most_bikes_available returns station with most bikes available" do
      station_1 = Station.create!(name: "blue",
                      lat: 1,
                      long: 1,
                      dock_count: 1,
                      city: "Richmond",
                      installation_date: DateTime.now)
      station_2 = Station.create!(name: "blue",
                      lat: 1,
                      long: 1,
                      dock_count: 5,
                      city: "Richmond",
                      installation_date: DateTime.now)

      expect(Station.most_bikes_available).to eq(station_2)
    end
  end
end
