require "rails_helper"

describe Status, type: :model do
  describe "validations" do
    it {should validate_presence_of :station_id}
    it {should validate_presence_of :bikes_available}
    it {should validate_presence_of :docks_available}
    it {should validate_presence_of :time}
  end
  describe "relationships" do
    it {should belong_to :station}
  end
end
