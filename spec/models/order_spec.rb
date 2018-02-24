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

  describe "class methods" do
    it "#by_status returns all orders for given status" do
      bob = User.create(username: "bob",
                        password: "test",
                        email:"bob@gmail.com")
      order_1 = bob.orders.create(status: "Ordered",
                                  total: 1111,
                                  submitted: DateTime.now)
      order_2 = bob.orders.create(status: "Ordered",
                                  total: 2222,
                                  submitted: DateTime.now)
      order_3 = bob.orders.create(status: "Paid",
                                  total: 3333,
                                  submitted: DateTime.now)
      order_4 = bob.orders.create(status: "Cancelled",
                                  total: 44444,
                                  submitted: DateTime.now)
      order_5 = bob.orders.create(status: "Completed",
                                  total: 5555,
                                  submitted: DateTime.now)

      expect(Order.by_status("Ordered")).to eq([order_1, order_2])
      expect(Order.by_status("Completed")).to eq([order_5])
    end
  end
end
