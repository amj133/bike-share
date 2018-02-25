require 'rails_helper'

describe "user can view order breakdown" do
  context "adds items to cart, visits dashboard and clicks on specific order" do
    it "shows order break down" do
      accessory_1 = create(:accessory, price: 110)
      accessory_2 = create(:accessory, price: 225)
      bob = User.create(username: "bob", password: "test", email:"bob@gmail.com")

      visit root_path
      click_link("Login")
      fill_in("Username", with: "bob")
      fill_in("Password", with: "test")
      click_button("Log in")

      visit bike_shop_path
      click_on("Add to cart", match: :first)
      all('#add-to-cart')[1].click

      visit cart_path
      click_on("Checkout")
      click_on("Order 1")

      expect(current_path).to eq(order_path(1))
      expect(page).to have_content(accessory_1.name)
      expect(page).to have_content("Quantity: 1")
      expect(page).to have_content("Subtotal: $110.00")
      expect(page).to have_content(accessory_2.name)
      expect(page).to have_content("Subtotal: $225.00")
      expect(page).to have_content("Order Total: $335.00")
      expect(page).to have_content("Status: Ordered")
      expect(page).to have_content("Submitted: #{DateTime.now.utc.strftime("%l:%M %P, %-m/%-d/%Y")}")
    end
  end

  context "can view order breakdown when multiple orders submitted" do
    it "shows order break down" do
      accessory_1 = create(:accessory, price: 110)
      accessory_2 = create(:accessory, price: 225)
      bob = User.create(username: "bob", password: "test", email:"bob@gmail.com")

      visit root_path
      click_link("Login")
      fill_in("Username", with: "bob")
      fill_in("Password", with: "test")
      click_button("Log in")

      visit bike_shop_path
      click_on("Add to cart", match: :first)
      all('#add-to-cart')[1].click
      visit cart_path
      click_on("Checkout")

      visit bike_shop_path
      click_on("Add to cart", match: :first)
      visit cart_path
      click_on("Checkout")
      click_on("Order 3")

      expect(current_path).to eq(order_path(3))
      expect(page).to have_content(accessory_1.name)
      expect(page).to have_content("Quantity: 1")
      expect(page).to have_content("Subtotal: $110.00")
      expect(page).to have_content("Order Total: $110.00")
      expect(page).to have_content("Status: Ordered")
      expect(page).to have_content("Submitted: #{DateTime.now.utc.strftime("%l:%M %P, %-m/%-d/%Y")}")
    end

    it "displays updated at timestamp for completed and cancelled orders" do
      bob = User.create(username: "bob", password: "test", email:"bob@gmail.com")
      order_1 = bob.orders.create(status: "Completed", total: 50, updated_at: DateTime.new(2011, 9, 1), submitted: DateTime.new(2011, 8, 18))
      order_2 = bob.orders.create(status: "Cancelled", total: 60, updated_at: DateTime.new(2011, 9, 3), submitted: DateTime.new(2011, 7, 18))

      visit root_path
      click_link("Login")
      fill_in("Username", with: "bob")
      fill_in("Password", with: "test")
      click_button("Log in")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(bob)

      visit dashboard_path(bob)
      click_on("Order #{order_1.id}")

      expect(page).to have_content("Date Completed: 9/1/2011")
    end
  end
end
