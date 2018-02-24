require "rails_helper"

describe Condition, type: :model do
  describe "validations" do
    it {should validate_presence_of :date}
    it {should validate_presence_of :max_temp_f}
    it {should validate_presence_of :mean_temp_f}
    it {should validate_presence_of :min_temp_f}
    it {should validate_presence_of :mean_humidity}
    it {should validate_presence_of :mean_visibility_miles}
    it {should validate_presence_of :mean_wind_speed}
    it {should validate_presence_of :precipitation_inches}
  end

  describe "relationships" do
    it {should have_many :trips}
  end

  describe "class methods" do
    describe "class methods" do
      it "#rides_by_date" do
        date = Time.new(2001,2,3)
        date_2 = Time.new(2009,2,3)
        create(:station, id: 1)
        create(:station, id: 2)
        create_list(:condition, 10, max_temp_f: 8, date: date)
        create_list(:condition, 9, max_temp_f: 4, date: date_2)
        create_list(:trip, 8, start_station_id: 1, end_station_id: 2, start_date: date)
        create_list(:trip, 8, start_station_id: 1, end_station_id: 2, start_date: date_2)

        expect(Condition.rides_by_date("max_temp_f", 7, 9)).to eq({date => 80})
        expect(Condition.rides_by_date("max_temp_f", 3, 9)).to eq({date => 80, date_2 => 72})
      end
    end
  end
end
