require 'rails_helper'

describe "admin can view all orders" do
  context "visits dashboard" do
    it "shows a list of all orders and order count by status" do
      jane = User.create(username: "jane",
                        password: "test",
                        email:"jane@gmail.com")
      bob = User.create(username: "bob",
                        password: "test",
                        email:"bob@gmail.com",
                        role: 1)
      order_1 = jane.orders.create(status: "Ordered",
                                   total: 1111,
                                   submitted: DateTime.now)
      order_2 = jane.orders.create(status: "Ordered",
                                   total: 2222,
                                   submitted: DateTime.now)
      order_3 = jane.orders.create(status: "Paid",
                                   total: 3333,
                                   submitted: DateTime.now)
      order_4 = jane.orders.create(status: "Cancelled",
                                   total: 44444,
                                   submitted: DateTime.now)
      order_5 = jane.orders.create(status: "Completed",
                                   total: 5555,
                                   submitted: DateTime.now)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(bob)
      allow_any_instance_of(ApplicationController).to receive(:current_admin?).and_return(bob)

      visit admin_dashboard_path

      expect(page).to have_link(order_1.id)
      expect(page).to have_link(order_2.id)
      expect(page).to have_link(order_3.id)
      expect(page).to have_link(order_4.id)
      expect(page).to have_link(order_5.id)
      expect(page).to have_content("Order Count By Status:")
      expect(page).to have_content("Ordered: 2")
      expect(page).to have_content("Paid: 1")
      expect(page).to have_content("Cancelled: 1")
      expect(page).to have_content("Completed: 1")
    end
  end
end
