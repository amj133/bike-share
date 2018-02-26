require 'rails_helper'

describe "visitor can add accessories to cart" do
  before(:each) do
    @helmet = Accessory.create!(name: "helmet",
                               description: "awesome blue helmet",
                               price: 3450,
                               image_path: 'bike.png')
  end
  describe "goes to bike-shop path" do
    it "allows visitor to add accessory to cart" do
      visit bike_shop_path
      click_on("Add to cart")

      expect(page).to have_content("You now have 1 #{@helmet.name} in your cart.")
    end

    it "shows correct message when multiple accessories added" do
      visit bike_shop_path
      click_on("Add to cart")

      expect(page).to have_content("You now have 1 #{@helmet.name} in your cart.")

      click_on("Add to cart")

      expect(page).to have_content("You now have 2 #{@helmet.name}s in your cart.")
    end

    it "total accessories in cart increments" do
      visit bike_shop_path

      expect(page).to have_content("0")

      click_button("Add to cart")

      expect(page).to have_content("1")

      visit conditions_path

      expect(page).to have_content("1")
    end
  end

  describe "visitor tries to checkout" do
    it "redirects them to login page" do
      visit bike_shop_path
      click_on("Add to cart")

      visit cart_path
      click_on('Checkout')

      expect(current_path).to eq(login_path)
      expect(page).to have_content("Must be logged in to checkout!")
    end
  end
end
