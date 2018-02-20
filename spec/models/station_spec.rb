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
      create(:station, dock_count: 1)
      create(:station, dock_count: 5)

      expect(Station.avg_bikes_per_station).to eq(3)
    end

    it "#most_bikes_available returns station with most bikes available" do
      station_1 = create(:station, dock_count: 1)
      station_2 = create(:station, dock_count: 5)

      expect(Station.most_bikes_available).to eq(station_2)
    end

    it "#fewest_bikes_available returns station with fewest bikes available" do
      station_1 = create(:station, dock_count: 1)
      station_2 = create(:station, dock_count: 5)

      expect(Station.fewest_bikes_available).to eq(station_1)
    end

    it "#most_recently_installed returns correct station" do
      station_1 = create(:station, installation_date: DateTime.new(2001, 10, 12))
      station_2 = create(:station, installation_date: DateTime.new(2011, 1, 3))
      station_3 = create(:station, installation_date: DateTime.new(2005, 10, 11))

      expect(Station.most_recently_installed).to eq(station_2)
    end

    it "#oldest_station returns correct station" do
      station_1 = create(:station, installation_date: DateTime.new(2011, 1, 3))
      station_2 = create(:station, installation_date: DateTime.new(2001, 10, 12))
      station_3 = create(:station, installation_date: DateTime.new(2005, 10, 11))

      expect(Station.oldest_station).to eq(station_2)
    end
  end
end
