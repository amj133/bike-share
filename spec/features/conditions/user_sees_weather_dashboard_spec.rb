require "rails_helper"

describe "user visit dashboard view" do
  it "displays condition analytics to user" do
    date = Time.new(2001,2,3)
    date_2 = Time.new(2009,2,3)
    create(:station, id: 1)
    create(:station, id: 2)
    create(:condition, max_temp_f: 8, date: date)
    create(:condition, max_temp_f: 17, date: date_2)
    create_list(:trip, 8, start_station_id: 1, end_station_id: 2, start_date: date)
    create_list(:trip, 10, start_station_id: 1, end_station_id: 2, start_date: date_2)
    user = User.create(username: 'Bob', password: 'password')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit weather_dashboard_path

    expect(page).to have_content("Temperature Range Average Rides per Day Most Rides in a Day	Least Rides in a Day")
    expect(page).to have_content("Precipitation Range Average Rides per Day Most Rides in a Day	Least Rides in a Day")
    expect(page).to have_content("Wind Speed Range Average Rides per Day Most Rides in a Day	Least Rides in a Day")
    expect(page).to have_content("Visibility Range Average Rides per Day Most Rides in a Day	Least Rides in a Day")
    expect(page).to have_content("0 - 10 ° F 8 8 8 10 - 20 ° F 10 10 10")
    expect(page).to have_content(Condition.average_rides_per_day('max_temp_f', 0, 10))
    expect(page).to have_content(Condition.average_rides_per_day('mean_wind_speed', 0, 4))
    expect(page).to have_content(Condition.average_rides_per_day('mean_visibility_miles', 0, 4))
    expect(page).to have_content(Condition.average_rides_per_day('precipitation_inches', 0, 0.5))
  end
end
