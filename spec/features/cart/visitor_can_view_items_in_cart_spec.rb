require 'rails_helper'

describe "visitor can view items in cart" do
  context "visits /cart" do
    it "shows all items in cart" do
      accessory_1 = create(:accessory)

      visit bike_shop_path
      click_on("Add to cart")
      visit cart_path

      expect(current_path).to eq('/cart')
      expect(page).to have_content("Cart: 1")
      expect(page).to have_content(accessory_1.name)
      expect(page).to have_content(accessory_1.price)
      expect(page).to have_button("remove")
    end
  end

  context "can remove items from cart" do
    it "clicks on remove button and receives message" do
      accessory_1 = create(:accessory)

      visit bike_shop_path
      click_on("Add to cart")
      visit cart_path
      click_on("remove")

      expect(current_path). to eq('/cart')
      expect(page).to have_content("Cart: 0")
      expect(page).to have_content("Successfully removed")
      expect(page).to_not have_content(accessory_1.price)
      click_on("#{accessory_1.name}")

      expect(current_path).to eq(accessory_path(accessory_1))
    end
  end

  context "can increase quantity of existing items" do
    it "clicks on increase quantity and quantity increases" do
      accessory_1 = create(:accessory, price: 2050)

      visit bike_shop_path
      click_on("Add to cart")
      visit cart_path
      click_on("Increase quantity")

      expect(current_path). to eq('/cart')
      expect(page).to have_content("Cart: 2")
      expect(page).to have_content(accessory_1.name)
      expect(page).to have_content(accessory_1.price)
      expect(page).to have_content("Quantity: 2")
      expect(page).to have_content("Subtotal: 4100")      
    end
  end
end
