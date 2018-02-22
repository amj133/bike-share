require 'rails_helper'

describe "visitor can view items in cart" do
  describe "visits /cart" do
    it "shows all items in cart" do
      accessory_1 = create(:accessory)

      visit bike_shop_path

      click_on("Add to cart")

      visit cart_path

      expect(current_path).to eq('/cart')
      expect(page).to have_content(accessory_1.name)
      expect(page).to have_content(accessory_1.price)
      expect(page).to have_button("remove")
    end
  end
end
