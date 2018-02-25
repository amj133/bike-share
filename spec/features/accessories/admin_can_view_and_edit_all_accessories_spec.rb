require 'rails_helper'

describe "admin visits dashboard and clicks accessories link" do
  it "displays information for all accessories" do
    bob = User.create(username: "bob",
                      password: "test",
                      email:"bob@gmail.com",
                      role: 1)
    accessory_1 = create(:accessory, status: "active", price: 101)
    accessory_2 = create(:accessory, status: "inactive", price: 102)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(bob)

    visit admin_dashboard_path
    click_on('View all accessories')

    expect(current_path).to eq('/admin/bike-shop')
    expect(page).to have_content(accessory_1.name)
    expect(page).to have_content(accessory_1.description)
    expect(page).to have_content("$101.00")
    expect(page).to have_content(accessory_1.status)
    expect(page).to have_content(accessory_2.name)
    expect(page).to have_content(accessory_2.description)
    expect(page).to have_content("$102.00")
    expect(page).to have_content(accessory_2.status)
  end

  it "allows admin to edit accessory" do
    bob = User.create(username: "bob",
                      password: "test",
                      email:"bob@gmail.com",
                      role: 1)
    accessory_1 = create(:accessory, status: "active")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(bob)

    visit admin_dashboard_path
    click_on('View all accessories')
    click_on('edit')
    fill_in('Name', with: 'helmet')
    select('inactive', :from => 'Status')
    fill_in('Price', with: 43.45)
    click_on('Update Accessory')

    expect(current_path).to eq('/admin/bike-shop')
    expect(page).to have_content('helmet')
    expect(page).to have_content('inactive')
    expect(page).to have_content("$43.45")
  end

end
