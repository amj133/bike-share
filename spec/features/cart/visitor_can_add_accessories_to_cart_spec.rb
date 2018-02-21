require 'rails_helper'

describe "visitor can add accessories to cart" do
  describe "goes to bike-shop path" do
    it "allows visitor to add accessory to cart" do
      helmet = Accessory.create!(name: "helmet",
                                 description: "awesome blue helmet",
                                 price: 3450)

      visit bike_shop_path
      click_on("Add to cart")

      expect(page).to have_content("You now have 1 #{helmet.name} in your cart.")

      visit conditions_path

      expect(page).to have_content("1 item in cart")
    end
  end
end
