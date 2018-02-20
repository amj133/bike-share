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
    before(:context) do
      create_list(:station, 2)
    end
    it "calculates average ride duration" do
      create(:trip, duration: 300)
      create(:trip, duration: 400)
      create(:trip, duration: 500)

      expect(Trip.avg_ride_duration).to eq(400)
    end
    it "calculates longest ride" do
      create(:trip, duration: 300)
      create(:trip, duration: 400)
      create(:trip, duration: 500)

      expect(Trip.longest_ride).to eq(500)
    end
    it "calculates longest ride" do
      create(:trip, duration: 300)
      create(:trip, duration: 400)
      create(:trip, duration: 500)

      expect(Trip.shortest_ride).to eq(300)
    end
    it "calculates the station with most starting rides" do
      create(:trip, start_station_id: 1)
      create(:trip, start_station_id: 1)
      create(:trip, start_station_id: 2)

      expect(Trip.most_starting_station.id).to eq(1)
    end
    it "calculates the station with most starting rides" do
      create(:trip, end_station_id: 1)
      create(:trip, end_station_id: 1)
      create(:trip, end_station_id: 2)

      expect(Trip.most_ending_station.id).to eq(1)
    end
    it "calculates the most ridden bike & that bike's trip count" do
      create(:trip, bike_id: 1)
      create(:trip, bike_id: 1)
      create(:trip, bike_id: 2)

      expect(Trip.most_ridden_bike.bike_id).to eq(1)
      expect(Trip.most_ridden_bike.trip_count).to eq(2)
    end
    it "calculates the least ridden bike & that bike's trip count" do
      create(:trip, bike_id: 1)
      create(:trip, bike_id: 1)
      create(:trip, bike_id: 2)

      expect(Trip.least_ridden_bike.bike_id).to eq(2)
      expect(Trip.least_ridden_bike.trip_count).to eq(1)
    end
    it "calculates user subscription type with count" do
      create(:trip, subscription: "customer")
      create(:trip, subscription: "customer")
      create(:trip, subscription: "subscriber")

      expect(Trip.user_subscrip_count).to eq({'customer' => 2, 'subscriber' => 1})
    end
    it "calculates user subscription type with percentage" do
      create(:trip, subscription: "customer")
      create(:trip, subscription: "customer")
      create(:trip, subscription: "subscriber")

      expect(Trip.user_subscrip_percentage).to eq({'customer' => (2/3.0), 'subscriber' => (1/3.0)})
    end
    it "calculates most popular date to start trip" do
      create(:trip, start_date: DateTime.new(2011, 4, 5))
      create(:trip, start_date: DateTime.new(2011, 4, 5))
      create(:trip, start_date: DateTime.new(2011, 3, 4))

      expect(Trip.most_popular_date).to eq("2011-04-05")
    end
    it "calculates least popular date to start trip" do
      create(:trip, start_date: DateTime.new(2011, 4, 5))
      create(:trip, start_date: DateTime.new(2011, 4, 5))
      create(:trip, start_date: DateTime.new(2011, 3, 4))

      expect(Trip.least_popular_date).to eq("2011-03-04")
    end
    it "calculates month by month breakdown of number of rides with subtotals for each with year" do
      create(:trip, start_date: DateTime.new(2011, 4, 5))
      create(:trip, start_date: DateTime.new(2011, 4, 5))
      create(:trip, start_date: DateTime.new(2011, 3, 4))

      expect(Trip.month_breakdown).to eq("2011-03-04")
    end
  end
end
