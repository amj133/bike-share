require "rails_helper"

describe "visitor sees trips index" do
  before(:context) do
    create(:station)
    create(:station)
    create_list(:trip, 61)
  end
  it "displays first 30 trips per page" do
    visit trips_path

    expect(page).to have_content("Displaying Trips 1-30")
    expect(page).to have_content(Trip.first.duration)
    expect(page).to have_content(Trip.first.start_date)
    expect(page).to have_content(Trip.first.start_station.name)
    expect(page).to have_content(Trip.first.end_date)
    expect(page).to have_content(Trip.first.end_station.name)
    expect(page).to have_content(Trip.first.bike_id)
    expect(page).to have_content(Trip.first.subscription)
    expect(page).to have_content(Trip.first.zipcode)
    expect(page).to have_content(Trip.all[29].duration)
    expect(page).to_not have_content(Trip.last.duration)
    expect(page).to have_link("Next Page")
  end
  it "displays next 30 trips to visitor" do
    visit trips_path

    click_on "Next Page"

    expect(page).to have_content("Displaying Trips 31-60")
    expect(page).to have_content(Trip.all[30].zipcode)
    expect(page).to have_content(Trip.all[59].zipcode)
    expect(page).to_not have_content(Trip.all[29].zipcode)

    click_on "Previous Page"

    have_content(Trip.first.duration)
    expect(page).to have_content(Trip.all[29].zipcode)
  end
end
