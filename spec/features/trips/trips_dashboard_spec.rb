require "rails_helper"

describe "user visits trip dashboard" do
  it "displays trip analytics" do
    user = User.new(username: "Guy Fieri", password: "donkey$auce")
    create(:station)
    create(:station)
    create_list(:trip, 20)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit trips_dashboard_path

    expect(page).to have_content(Trip.avg_ride_duration)
    expect(page).to have_content(Trip.longest_ride.duration)
    expect(page).to have_content(Trip.shortest_ride.duration)
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
  it "displays weather stats for longest and shortest rides" do
    user = User.new(username: "Guy Fieri", password: "donkey$auce")
    create(:station)
    create(:station)
    create_list(:trip, 20)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit trips_dashboard_path
    expect(page).to have_content("Weather during the longest ride:")
    expect(page).to have_content(Trip.longest_ride.condition.mean_temp_f)
    expect(page).to have_content(Trip.longest_ride.condition.mean_wind_speed)
    expect(page).to have_content(Trip.longest_ride.condition.mean_humidity)
    expect(page).to have_content(Trip.longest_ride.condition.cloud_cover)
    expect(page).to have_content("Weather during the shortest ride:")
    expect(page).to have_content(Trip.shortest_ride.condition.mean_temp_f)
    expect(page).to have_content(Trip.shortest_ride.condition.mean_wind_speed)
    expect(page).to have_content(Trip.shortest_ride.condition.mean_humidity)
    expect(page).to have_content(Trip.shortest_ride.condition.cloud_cover)
  end
end
