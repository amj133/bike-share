require 'rails_helper'

describe "admin visits dashboard and clicks accessories link" do
  it "displays information for all accessories" do
    bob = User.create(username: "bob",
                      password: "test",
                      email:"bob@gmail.com",
                      role: 1)
    accessory_1 = create(:accessory, status: "active")
    accessory_2 = create(:accessory, status: "inactive")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(bob)
    allow_any_instance_of(ApplicationController).to receive(:current_admin?).and_return(bob)

    visit admin_dashboard_path
    click_on('View all accessories')

    expect(current_path).to eq('/admin/bike-shop')
    expect(page).to have_content(accessory_1.name)
    expect(page).to have_content(accessory_1.description)
    expect(page).to have_content(accessory_1.price)
    expect(page).to have_content(accessory_1.status)
    expect(page).to have_content(accessory_2.name)
    expect(page).to have_content(accessory_2.description)
    expect(page).to have_content(accessory_2.price)
    expect(page).to have_content(accessory_2.status)
  end

  it "allows admin to edit accessory" do
    bob = User.create(username: "bob",
                      password: "test",
                      email:"bob@gmail.com",
                      role: 1)
    accessory_1 = create(:accessory, status: "active")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(bob)
    allow_any_instance_of(ApplicationController).to receive(:current_admin?).and_return(bob)

    visit admin_dashboard_path
    click_on('View all accessories')
    click_on('edit')
    fill_in('name', with: 'helmet')
    click_on('Update Accessory')

    expect(current_path).to eq('/admin/bike-shop')
    expect(page).to have_content('helmet')
  end
end
