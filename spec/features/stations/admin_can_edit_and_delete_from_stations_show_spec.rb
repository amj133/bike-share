require 'rails_helper'

describe "Admin sees station show"  do
  it "Admin see edit button and delete button"  do
    station = create(:station, id: 1)
    trip    = create(:trip, start_station_id: 1, end_station_id: 1)
    user    = User.create(username: "Kyle", email: "email", password: "password" ,role: 1)

    visit root_path

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit station_path(station.slug)

    expect(page).to have_link("Edit")
    expect(page).to have_link("Delete")
  end
end

describe "user sees station show"  do
  it "user doesn't see edit button and delete button"  do
    station = create(:station, id: 1)
    trip = create(:trip, start_station_id: 1, end_station_id: 1)
    user = User.create(username: "Kyle", email: "email", password: "password" )

    visit root_path

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit station_path(station.slug)

    expect(page).to_not have_link("Edit")
    expect(page).to_not have_link("Delete")
  end
end

describe "Admin sees station show"  do
  it "Admin is able to delete station"  do
    station = create(:station, id: 1)
    trip = create(:trip, start_station_id: 1, end_station_id: 1)
    user = User.create(username: "Kyle", email: "email", password: "password" ,role: 1 )

    visit root_path

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit station_path(station.slug)

    click_link("Delete")
    expect(page).to_not have_link("Delete")
    expect(page).to have_content("Station #{station.name} deleted.")
  end
end

  describe "Admin sees station show"  do
    it "Admin is able to edit station"  do
      station = create(:station, id: 1)
      trip = create(:trip, start_station_id: 1, end_station_id: 1)
      user = User.create(username: "Kyle", email: "email", password: "password" ,role: 1 )

      visit root_path

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit station_path(station.slug)

      click_link("Edit")

      expect(page).to have_content("Edit Stations")
      fill_in("Name", with: "big fun")

      click_button("Update Station")

      expect(page).to have_content("Station at big-fun")
    end
  end
