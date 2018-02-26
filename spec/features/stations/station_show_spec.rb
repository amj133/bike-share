require 'rails_helper'

describe "visitor goes to station show page" do
  it "displays all attributes for that station" do
    station = create(:station)

    visit station_path(station.slug)

    expect(current_path).to eq(station_path(station.slug))
    expect(page).to have_content("Station at #{station.slug}")
    expect(page).to have_content(station.lat)
    expect(page).to have_content(station.long)
    expect(page).to have_content(station.dock_count)
    expect(page).to have_content(station.city)
    expect(page).to have_content(station.readable_install_date)
    expect(page).to_not have_content("Station Analytics")
  end
end

describe "user goes to station show page" do
  it "displays analytics specific to that station" do
    bob = User.create!(username: "bobrocks",
                       password: "test",
                       email: "email@gmail.com")
    station_1 = create(:station, id: 1, name: 'station1')
    station_2 = create(:station, id: 2, name: 'station2')
    create(:condition, date: DateTime.new(2001, 9, 1))
    create(:condition, date: DateTime.new(2001, 9, 2))
    create(:trip, start_station_id: 1, bike_id: 31, zipcode: 113111, end_station_id: 2, start_date: DateTime.new(2001, 9, 1))
    create(:trip, start_station_id: 1, bike_id: 29, zipcode: 115111, end_station_id: 2, start_date: DateTime.new(2001, 9, 2))
    create(:trip, start_station_id: 1, bike_id: 31, zipcode: 113111, end_station_id: 1, start_date: DateTime.new(2001, 9, 1))

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(bob)

    visit station_path(Station.first.slug)

    expect(page).to have_content("Number of rides started here: 3")
    expect(page).to have_content("Number of rides ended here: 1")
    expect(page).to have_content("Most frequent destination station: station2")
    expect(page).to have_content("Most frequent origination station: station1")
    expect(page).to have_content("Date with highest trips started: 9/1/2001")
    expect(page).to have_content("Most frequent zipcode of bikers: 11311")
    expect(page).to have_content("Bike ID that starts here most: 31")
  end
end
