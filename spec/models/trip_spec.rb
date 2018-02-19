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
      create(:trip, duration: 300)
      create(:trip, duration: 400)
      create(:trip, duration: 500)

      expect(Trip.avg_ride_duration).to eq(400)
    end
    it "calculates longest ride" do
      create_list(:station, 2)
      create(:trip, duration: 300)
      create(:trip, duration: 400)
      create(:trip, duration: 500)

      expect(Trip.longest_ride).to eq(500)
    end
  end
end
