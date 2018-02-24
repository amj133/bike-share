require 'rails_helper'

describe Order, type: :model do
  describe "validatons" do
    it {should validate_presence_of(:total)}
    it {should validate_presence_of(:status)}
    it {should validate_presence_of(:submitted)}
  end

  describe "relationships" do
    it {should belong_to(:user)}
    it {should have_many(:accessories).through(:order_accessories)}
  end
end
