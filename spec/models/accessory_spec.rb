require 'rails_helper'

describe Accessory, type: :model do
  describe "validations" do
    it {should validate_presence_of(:name)}
    it {should validate_uniqueness_of(:name)}
    it {should validate_presence_of(:description)}
    it {should validate_presence_of(:price)}
  end

  describe "relationships" do
    it {should have_many(:orders).through(:order_accessories)}
  end
end
