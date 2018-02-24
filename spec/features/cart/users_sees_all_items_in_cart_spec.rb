require 'rails_helper'

describe "user can view all items in cart" do
  context "visits their cart page" do
    it "shows accessories and their details" do
      accessory_1 = create(:accessory, price: 110)
      accessory_2 = create(:accessory, price: 225)
      bob = User.create(username: "bob", password: "test", email:"bob@gmail.com")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(bob)

      visit bike_shop_path
      click_on("Add to cart", match: :first)
      all('#add-to-cart')[1].click
      visit cart_path

      expect(page).to have_content(accessory_1.name)
      expect(page).to have_content(accessory_1.description)
      expect(page).to have_content(accessory_1.price)
      expect(page).to have_content("Quantity: 1")
      expect(page).to have_content("Subtotal: 110")
      expect(page).to have_content(accessory_2.name)
      expect(page).to have_content(accessory_2.description)
      expect(page).to have_content(accessory_2.price)
      expect(page).to have_content("Quantity: 1")
      expect(page).to have_content("Subtotal: 225")
      expect(page).to have_content("Cart Total: 335")
      expect(page).to have_button("Checkout")
    end

    it "after clicking checkout, displays message and directs to user dashboard" do
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

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("You have successfully submitted your order.")
    end
  end
end
