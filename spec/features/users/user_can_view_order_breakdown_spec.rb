require 'rails_helper'

describe "user can view order breakdown" do
  context "visits dashboard and clicks on specific order" do
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
      expect(page).to have_content("Subtotal: 110")
      expect(page).to have_content(accessory_2.name)
      expect(page).to have_content("Subtotal: 225")
      expect(page).to have_content("Order Total: 335")
      expect(page).to have_content("Status: Ordered")
      expect(page).to have_content("Submitted: #{DateTime.now.utc.strftime("%l:%M %P, %-m/%-d/%Y")}")
    end
  end
end
