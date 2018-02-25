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

      expect(page).to have_link("Order #{order_1.id}")
      expect(page).to have_link("Order #{order_2.id}")
      expect(page).to have_link("Order #{order_3.id}")
      expect(page).to have_link("Order #{order_4.id}")
      expect(page).to have_link("Order #{order_5.id}")
      expect(page).to have_content("Order Count By Status:")
      expect(page).to have_content("Ordered: 2")
      expect(page).to have_content("Paid: 1")
      expect(page).to have_content("Cancelled: 1")
      expect(page).to have_content("Completed: 1")
    end

    it "admin can filter displayed orders by status" do
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
      click_on('Paid')

      expect(page).to have_link("Order #{order_3.id}")
      expect(page).to_not have_link("Order #{order_1.id}")
      expect(page).to_not have_link("Order #{order_2.id}")
      expect(page).to_not have_link("Order #{order_4.id}")
      expect(page).to_not have_link("Order #{order_5.id}")

      click_on('Ordered')
      expect(page).to have_link("Order #{order_1.id}")
      expect(page).to have_link("Order #{order_2.id}")
      expect(page).to_not have_link("Order #{order_3.id}")
      expect(page).to_not have_link("Order #{order_4.id}")
      expect(page).to_not have_link("Order #{order_5.id}")

      click_on('Cancelled')
      expect(page).to have_link("Order #{order_4.id}")
      expect(page).to_not have_link("Order #{order_1.id}")
      expect(page).to_not have_link("Order #{order_2.id}")
      expect(page).to_not have_link("Order #{order_3.id}")
      expect(page).to_not have_link("Order #{order_5.id}")

      click_on('Completed')
      expect(page).to have_link("Order #{order_5.id}")
      expect(page).to_not have_link("Order #{order_1.id}")
      expect(page).to_not have_link("Order #{order_2.id}")
      expect(page).to_not have_link("Order #{order_3.id}")
      expect(page).to_not have_link("Order #{order_4.id}")
    end

    it "admin can change status of order" do
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
      order_2 = jane.orders.create(status: "Paid",
                                   total: 3333,
                                   submitted: DateTime.now)
      order_4 = jane.orders.create(status: "Ordered",
                                   total: 4444,
                                   submitted: DateTime.now)
      order_5 = jane.orders.create(status: "Paid",
                                   total: 5555,
                                   submitted: DateTime.now)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(bob)
      allow_any_instance_of(ApplicationController).to receive(:current_admin?).and_return(bob)

      visit admin_dashboard_path
      click_on('cancel', match: :first)

      expect(current_path).to eq(admin_dashboard_path)
      expect(Order.find_by(total: 1111).status).to eq("Cancelled")

      click_on('cancel', match: :first)

      expect(Order.find_by(total: 3333).status).to eq("Cancelled")

      click_on('mark as paid', match: :first)

      expect(Order.find_by(total: 4444).status).to eq("Paid")

      click_on('mark as completed', match: :first)

      expect(Order.find_by(total: 5555).status).to eq("Completed")
    end
  end
end
