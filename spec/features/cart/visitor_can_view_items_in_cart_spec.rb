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
    it "clicks on increase quantity, quantity & subtotal increases" do
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

    it "cart total will increase" do
      accessory_1 = create(:accessory, price: 2050)
      accessory_2 = create(:accessory, price: 1125)

      visit bike_shop_path
      click_on("Add to cart", match: :first)
      all('#add-to-cart')[1].click
      visit cart_path
      click_on("Increase quantity", match: :first)

      expect(current_path). to eq('/cart')
      expect(page).to have_content('Cart Total: 5225')
    end
  end

  context "can decrease quantity of existing items" do
    it "clicks on decrease quantity, quantity, subtotal, & cart total decreases" do
      accessory_1 = create(:accessory, price: 2050)

      visit bike_shop_path
      click_on("Add to cart")
      visit cart_path
      click_on("Increase quantity")

      expect(page).to have_content("Quantity: 2")
      expect(page).to have_content("Cart Total: 4100")
      expect(page).to have_content("Subtotal: 4100")

      click_on("Decrease quantity")

      expect(current_path). to eq('/cart')
      expect(page).to have_content("Quantity: 1")
      expect(page).to have_content("Cart Total: 1")
      expect(page).to have_content("Subtotal: 2050")
    end
  end
end
