require 'rails_helper'

describe Cart, type: :model do
  describe "instance methods" do
    it "#total_count calculates total accessories" do
      cart = Cart.new({"1" => 1, "2" => 3})

      expect(cart.total_count).to eq(4)
    end
  end
end
