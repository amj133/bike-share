require 'rails_helper'

describe "visitor goes to station show page" do
  it "displays all attributes for that station" do
    station = create(:station)

    visit station_path(station)

    expect(current_path).to eq('/stations/1')
    expect(page).to have_content("Station #{station.name}")
    expect(page).to have_content(station.lat)
    expect(page).to have_content(station.long)
    expect(page).to have_content(station.dock_count)
    expect(page).to have_content(station.city)
    expect(page).to have_content(station.installation_date)
  end
end

describe "user goes to station show page" do
  xit "displays number of rides started at station" do
    bob = User.create!(username: "bobrocks",
                       password: "test")
    create(:station)
    create(:station)
    create(:condition)
    create(:trip, start_station_id: 1, end_station_id: 2, start_date: DateTime.new(2001, 9, 1))
    create(:trip, start_station_id: 1, end_station_id: 2, start_date: DateTime.new(2001, 9, 1))

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(bob)

    visit station_path(Station.last)

    expect(page).to have_content("Number of rides started here: 2")
  end
end
