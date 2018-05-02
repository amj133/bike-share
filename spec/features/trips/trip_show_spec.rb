require 'rails_helper'

describe "user visits trip show page" do
  it "user sees all atributes of trip" do
    create(:condition, date: DateTime.new(2001, 9 ,1))
    station = Station.create!(name: "Big Bikes", lat: 123456, long:223523, dock_count:22, city:"denver" ,installation_date: Time.now)
    trip = Trip.create!(duration: 73, start_date: DateTime.new(2001, 9 ,1), start_station_id: 1,
    end_date: DateTime.new(2001, 9, 12), end_station_id: 1, bike_id: 22, subscription: "Subscriber",
    zipcode: 32218)

    visit trip_path(trip)

    expect(page).to have_content(Time.at(73 * 60).utc.strftime("%k hrs %M min"))
    expect(page).to have_content(trip.start_date)
    expect(page).to have_content(trip.start_station_id)
    expect(page).to have_content(trip.end_date)
    expect(page).to have_content(trip.end_station_id)
    expect(page).to have_content(trip.bike_id)
    expect(page).to have_content(trip.subscription)
    expect(page).to have_content(trip.zipcode)
  end
end
