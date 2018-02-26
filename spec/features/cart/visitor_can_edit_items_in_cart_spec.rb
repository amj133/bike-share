require 'rails_helper'

describe "visitor can edit items in cart" do
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
      expect(page).to have_button("Remove")
    end
  end

  context "can remove items from cart" do
    it "clicks on remove button and receives message" do
      accessory_1 = create(:accessory)

      visit bike_shop_path
      click_on("Add to cart")
      visit cart_path
      click_on("Remove")

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
      find(".increase-cart-link").click

      expect(current_path). to eq('/cart')
      expect(page).to have_content("Cart: 2")
      expect(page).to have_content(accessory_1.name)
      expect(page).to have_content("Unit Price: $2,050")
      expect(page).to have_content("Quantity: 2")
      expect(page).to have_content("Subtotal: $4,100.00")
    end

    it "cart total will increase" do
      accessory_1 = create(:accessory, price: 2050)
      accessory_2 = create(:accessory, price: 1125)

      visit bike_shop_path
      click_on("Add to cart", match: :first)
      all('#add-to-cart')[1].click
      visit cart_path
      all(".increase-cart-link")[0].click

      expect(current_path). to eq('/cart')
      expect(page).to have_content('Cart Total: $5,225.00')
    end
  end

  context "can decrease quantity of existing items" do
    it "clicks on decrease quantity, quantity, subtotal, & cart total decreases" do
      accessory_1 = create(:accessory, price: 2050)

      visit bike_shop_path
      click_on("Add to cart")
      visit cart_path
      find(".increase-cart-link").click

      expect(page).to have_content("Quantity: 2")
      expect(page).to have_content("Cart Total: $4,100.00")
      expect(page).to have_content("Subtotal: $4,100.00")

      find(".decrease-cart-link").click

      expect(current_path). to eq('/cart')
      expect(page).to have_content("Quantity: 1")
      expect(page).to have_content("Cart Total: $2,050.00")
      expect(page).to have_content("Subtotal: $2,050.00")
    end

    it "clicks on remove quantity, accessory removed from cart" do
      accessory_1 = create(:accessory, price: 2050)

      visit bike_shop_path
      click_on("Add to cart")
      visit cart_path
      find(".increase-cart-link").click

      expect(page).to have_content("Quantity: 2")
      expect(page).to have_content("Cart Total: $4,100.00")
      expect(page).to have_content("Subtotal: $4,100.00")

      click_on("Remove")

      expect(current_path). to eq('/cart')
      expect(page).to have_content("Cart Total: $0.00")
    end
  end
end
