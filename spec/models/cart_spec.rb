require 'rails_helper'

describe Cart, type: :model do
  describe "instance methods" do
    it "#total_count calculates total accessories" do
      cart = Cart.new({"1" => 1, "2" => 3})

      expect(cart.total_count).to eq(4)
    end

    it "#add_accessory changes content count" do
      cart = Cart.new({"1" => 1, "2" => 3})

      cart.add_accessory(1)
      cart.add_accessory(2)

      expect(cart.contents).to eq({"1" => 2, "2" => 4})
    end

    it "#remove_accessory changes content count" do
      cart = Cart.new({"1" => 1, "2" => 3})

      cart.remove_accessory(1)
      cart.remove_accessory(2)

      expect(cart.contents).to eq({"1" => 0, "2" => 2})
    end

    it "#count_of returns count of specific accessory" do
      cart = Cart.new({"1" => 1, "2" => 3})

      expect(cart.count_of(1)).to eq(1)
      expect(cart.count_of(2)).to eq(3)
    end

    it "#total_cost returns total cost" do
      create(:accessory, id: 1, price: 2)
      create(:accessory, id: 2, price: 5)
      cart = Cart.new({"1" => 2, "2" => 3})

      expect(cart.total_cost).to eq(19)
    end

  end
end
