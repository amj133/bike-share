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
    xit "#group_by_10_degree_intervals" do
      create_list(:trips, 8)
      create_list(:condition, 15)

      expect(Condition.group_by_10_degree_intervals).to eq()
    end
  end
end
