require "rails_helper"

describe "user visits trip dashboard" do
  it "displays trip analytics" do
    create_list(:trip, 20)

    visit trips_dashboard_path

    expect(page).to have_content(Trip.avg_ride_duration)
    expect(page).to have_content(Trip.longest_ride)
    expect(page).to have_content(Trip.shortest_ride)
    expect(page).to have_content(Trip.most_starting_station)
    expect(page).to have_content(Trip.most_ending_station)
    expect(page).to have_content(Trip.month_breakdown)
    expect(page).to have_content(Trip.most_ridden_bike)
    expect(page).to have_content(Trip.least_ridden_bike)
    expect(page).to have_content(Trip.user_subscrip_count)
    expect(page).to have_content(Trip.user_subscrip_percentage)
    expect(page).to have_content(Trip.most_popular_date)
    expect(page).to have_content(Trip.least_popular_date)
  end
end
