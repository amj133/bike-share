require "rails_helper"

describe "user visit dashboard view" do
  it "displays condition analytics to user" do
    date = Time.new(2001,2,3)
    date_2 = Time.new(2009,2,3)
    create(:station, id: 1)
    create(:station, id: 2)
    create(:condition, max_temp_f: 8, date: date)
    create(:condition, max_temp_f: 4, date: date_2)
    create_list(:trip, 8, start_station_id: 1, end_station_id: 2, start_date: date)
    create_list(:trip, 10, start_station_id: 1, end_station_id: 2, start_date: date_2)
    user = User.create(username: 'Bob', password: 'password')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit condition_dashboard_path

    expect(page).to have_content(Condition.average_rides_per_day('max_temp_f', 30, 39))
    expect(page).to have_content(Condition.average_rides_per_day('max_temp_f', 80, 89))
    expect(page).to have_content(Condition.date_with_most_rides('max_temp_f', 30, 39))
    expect(page).to have_content(Condition.date_with_most_rides('max_temp_f', 80, 89))
    expect(page).to have_content(Condition.date_with_least_rides('max_temp_f', 30, 39))
    expect(page).to have_content(Condition.date_with_least_rides('max_temp_f', 80, 89))
    expect(page).to have_content(Condition.average_rides_per_day('precipitation_inches', 0, 0.5))
    expect(page).to have_content(Condition.average_rides_per_day('precipitation_inches', 0.5, 1))
    expect(page).to have_content(Condition.date_with_most_rides('precipitation_inches', 0, 0.5))
    expect(page).to have_content(Condition.date_with_most_rides('precipitation_inches', 0.5, 1))
    expect(page).to have_content(Condition.date_with_least_rides('precipitation_inches', 0, 0.5))
    expect(page).to have_content(Condition.date_with_least_rides('precipitation_inches', 0.5, 1))
    expect(page).to have_content(Condition.average_rides_per_day('mean_wind_speed', 0, 4))
    expect(page).to have_content(Condition.average_rides_per_day('mean_wind_speed', 12, 16))
    expect(page).to have_content(Condition.date_with_most_rides('mean_wind_speed', 0, 4))
    expect(page).to have_content(Condition.date_with_most_rides('mean_wind_speed', 12, 16))
    expect(page).to have_content(Condition.date_with_least_rides('mean_wind_speed', 0, 4))
    expect(page).to have_content(Condition.date_with_least_rides('mean_wind_speed', 12, 16))
    expect(page).to have_content(Condition.average_rides_per_day('mean_visibility_miles', 0, 4))
    expect(page).to have_content(Condition.average_rides_per_day('mean_visibility_miles', 8, 12))
    expect(page).to have_content(Condition.date_with_most_rides('mean_visibility_miles', 0, 4))
    expect(page).to have_content(Condition.date_with_most_rides('mean_visibility_miles', 80, 10))
    expect(page).to have_content(Condition.date_with_least_rides('mean_visibility_miles', 0, 4))
    expect(page).to have_content(Condition.date_with_least_rides('mean_visibility_miles', 8, 12))
  end
end
