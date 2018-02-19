require 'rails_helper'

describe Trip, type: :model do
  describe "validations" do
    it {should validate_presence_of(:duration)}
    it {should validate_presence_of(:start_date)}
    it {should validate_presence_of(:start_station_id)}
    it {should validate_presence_of(:end_date)}
    it {should validate_presence_of(:end_station_id)}
    it {should validate_presence_of(:bike_id)}
    it {should validate_presence_of(:subscription)}
    it {should validate_presence_of(:zipcode)}
  end
  describe "relationships" do
    it {should belong_to :start_station}
    it {should belong_to :end_station}
  end
  describe "class methods" do
    it "calculates average ride duration" do
      create_list(:station, 2)

      Trip.create(duration: 300, start_date: DateTime.now, end_date: DateTime.now, bike_id: 1, subscription: "x", zipcode: 80111, start_station_id: 1, end_station_id: 2)

      Trip.create(duration: 400, start_date: DateTime.now, end_date: DateTime.now, bike_id: 1, subscription: "x", zipcode: 80111, start_station_id: 1, end_station_id: 2)

      Trip.create(duration: 500, start_date: DateTime.now, end_date: DateTime.now, bike_id: 1, subscription: "x", zipcode: 80111, start_station_id: 1, end_station_id: 2)

      expect(Trip.avg_ride_duration).to eq(400)
    end
  end
end
