require "rails_helper"

describe "visitor sees trips index" do
  before(:context) do
    create(:station)
    create(:station)
    create(:condition, date: DateTime.new(2001, 9, 1))
    create_list(:trip, 61, start_date: DateTime.new(2001, 9, 1))
  end

  it "displays first 30 trips per page" do
    visit trips_path

    expect(page).to have_content("Displaying Trips 1-30")
    expect(page).to have_content(Time.at(Trip.first.duration * 60).utc.strftime("%k hrs %M min"))
    expect(page).to have_content(Trip.first.start_date.strftime("%b %d, %Y"))
    expect(page).to have_content(Trip.first.start_station.name)
    expect(page).to have_content(Trip.first.end_date.strftime("%b %d, %Y"))
    expect(page).to have_content(Trip.first.end_station.name)
    expect(page).to have_content(Trip.first.bike_id)
    expect(page).to have_content(Trip.first.subscription)
    expect(page).to have_content(Trip.first.zipcode)
    expect(page).to have_content(Time.at(Trip.all[29].duration * 60).utc.strftime("%k hrs %M min"))
    expect(page).to_not have_content(Trip.last.duration)
    expect(page).to have_link("Next Page")
  end

  it "displays next 30 trips to visitor" do
    visit trips_path

    click_on "Next Page"

    expect(page).to have_content("Displaying Trips 31-60")
    expect(page).to have_content(Trip.all[30].zipcode)
    expect(page).to have_content(Trip.all[59].zipcode)
    expect(page).to_not have_content(Trip.all[29].subscription)

    click_on "Previous Page"

    have_content(Trip.first.duration)
    expect(page).to have_content(Trip.all[29].zipcode)
  end
end
