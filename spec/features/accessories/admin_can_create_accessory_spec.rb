require 'rails_helper'

describe "admin can create an accessory" do
  context "visit /bike-shop/new" do
    it "fill out all information and creates new accessory" do
      bob = User.create(username: "bob",
                        password: "test",
                        email:"bob@gmail.com",
                        role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(bob)

      visit bike_shop_new_path
      fill_in('Name', with: 'Gloves')
      fill_in('Description', with: 'Keep your hands warm!')
      fill_in('Price', with: 1234)
      click_on('Create Accessory')

      expect(current_path).to eq(admin_bike_shop_path)
      expect(page).to have_content(Accessory.last.name)
      expect(page).to have_content(Accessory.last.description)
      expect(page).to have_content(Accessory.last.price)
    end
  end
end
