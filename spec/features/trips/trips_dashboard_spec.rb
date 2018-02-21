require "rails_helper"

describe "user visits trip dashboard" do
  it "displays trip analytics" do
    create(:station)
    create(:station)
    create_list(:trip, 20)

    visit trips_dashboard_path

    expect(page).to have_content(Trip.avg_ride_duration)
    expect(page).to have_content(Trip.longest_ride)
    expect(page).to have_content(Trip.shortest_ride)
    expect(page).to have_content(Trip.most_starting_station.name)
    expect(page).to have_content(Trip.most_starting_station.city)
    expect(page).to have_content(Trip.most_ending_station.name)
    expect(page).to have_content(Trip.most_ending_station.city)
    expect(page).to have_content(Trip.most_ridden_bike.bike_id)
    expect(page).to have_content(Trip.most_ridden_bike.trip_count)
    expect(page).to have_content(Trip.least_ridden_bike.bike_id)
    expect(page).to have_content(Trip.least_ridden_bike.trip_count)
    expect(page).to have_content(Trip.most_popular_date)
    expect(page).to have_content(Trip.least_popular_date)
    expect(page).to have_content("rides in")
    expect(page).to have_content("of all subscriptions")
  end
end
