require 'rails_helper'

  describe "user visits trip show page" do
    it "user sees all atributes of trip" do

    station = Station.create!(name: "Big Bikes", lat: 123456, long:223523, dock_count:22, city:"denver" ,installation_date: Time.now)
    trip = Trip.create!(duration: 73, start_date: Time.now, start_station_id: 1,
    end_date: Time.now, end_station_id: 1, bike_id: 22, subscription: "Subscriber",
    zipcode: 32218)

    visit trip_path(trip)

    expect(page).to have_content(trip.duration)
    expect(page).to have_content(trip.start_date)
    expect(page).to have_content(trip.start_station_id)
    expect(page).to have_content(trip.end_date)
    expect(page).to have_content(trip.end_station_id)
    expect(page).to have_content(trip.bike_id)
    expect(page).to have_content(trip.subscription)
    expect(page).to have_content(trip.zipcode)
  end
end

describe "user visits trip show page" do
  it "user sees all atributes of trip" do

  station = Station.create!(name: "Super Bikes", lat: 12342342, long:2342342, dock_count:22, city:"Jacksonville" ,installation_date: Time.now)
  trip = Trip.create!(duration: 23, start_date: Time.now, start_station_id: 1,
  end_date: Time.now, end_station_id: 1, bike_id: 23, subscription: "Subscriber",
  zipcode: 80205)

  visit trip_path(trip)

  expect(page).to have_content(trip.duration)
  expect(page).to have_content(trip.start_date)
  expect(page).to have_content(trip.start_station_id)
  expect(page).to have_content(trip.end_date)
  expect(page).to have_content(trip.end_station_id)
  expect(page).to have_content(trip.bike_id)
  expect(page).to have_content(trip.subscription)
  expect(page).to have_content(trip.zipcode)
  end 
end
