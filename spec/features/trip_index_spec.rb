require "rails_helper"

describe "visitor sees trips index" do
  it "displays 30 trips per page" do
    create(:station)
    create(:station)
    31.times do
      create(:trip)
    end

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
    expect(page).to have_content(Trip.all[-2].duration)
    expect(page).to_not have_content(Trip.last.duration)
    expect(page).to have_link("Next Page")
  end
end
