require 'rails_helper'

describe "Admin sees station new page"  do
  it "Admin sees form to create a new staion"  do
    station = create(:station, id: 1)
    trip = create(:trip, start_station_id: 1, end_station_id: 1)
    user = User.create(username: "Kyle", email: "email",
                        password: "password" ,role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit new_admin_station_path

    expect(current_path).to eq new_admin_station_path
  end
end

describe "Admin sees station new page"  do
  it "Admin is able to create a new station"  do
    station = create(:station, id: 2)
    station = create(:station, id: 3)
    trip = create(:trip, start_station_id: 2, end_station_id: 3)
    user = User.create(username: "Kyle", email: "email",
    password: "password" ,role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit new_admin_station_path

    fill_in("Name", with: "riding")
    fill_in("Lat", with: 1245654)
    fill_in("Long", with:1245654)
    fill_in("Dock count", with: 23)
    fill_in("City", with: "Jacksonville")
    fill_in("Installation date", with: "Aug 21, 2013")

    click_button("Create Station")

    expect(page).to have_content("riding")
    expect(page).to have_content("Station riding created.")
    expect(page).to have_content(1245654)
    expect(page).to have_content(1245654)
    expect(page).to have_content(23)
    expect(page).to have_content("Jacksonville")
    expect(page).to have_content("Aug 21, 2013")
  end
end
