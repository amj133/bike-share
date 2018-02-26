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
      select('active', from: 'Status')
      click_on('Create Accessory')

      expect(current_path).to eq(admin_bike_shop_path)
      expect(page).to have_content(Accessory.last.name)
      expect(page).to have_content(Accessory.last.description)
      expect(page).to have_content("1,234.00")
    end

    it "cannot create accessory with duplicate name" do
      bob = User.create(username: "bob",
                        password: "test",
                        email:"bob@gmail.com",
                        role: 1)
      create(:accessory, name: "helmet")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(bob)

      visit bike_shop_new_path
      fill_in('Name', with: 'helmet')
      fill_in('Description', with: 'Keep your hands warm!')
      fill_in('Price', with: 1234)
      click_on('Create Accessory')

      expect(current_path).to eq(accessories_path)
      expect(Accessory.count).to eq(1)
    end

    it "cannot create accessory without name, descr, or price" do
      bob = User.create(username: "bob",
                        password: "test",
                        email:"bob@gmail.com",
                        role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(bob)

      visit bike_shop_new_path
      fill_in('Description', with: 'Keep your hands warm!')
      fill_in('Price', with: 1234)
      click_on('Create Accessory')

      expect(current_path).to eq(accessories_path)
      expect(Accessory.count).to eq(0)

      fill_in('Name', with: 'helmet')
      fill_in('Description', with: '')
      fill_in('Price', with: 1234)
      click_on('Create Accessory')

      expect(current_path).to eq(accessories_path)
      expect(Accessory.count).to eq(0)

      fill_in('Name', with: 'helmet')
      fill_in('Description', with: 'Keep your hands warm!')
      fill_in('Price', with: '')
      click_on('Create Accessory')

      expect(current_path).to eq(accessories_path)
      expect(Accessory.count).to eq(0)
    end
  end
end
