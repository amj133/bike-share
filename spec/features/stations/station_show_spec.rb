require 'rails_helper'

describe "visitor goes to station show page" do
  it "displays all attributes for that station" do
    station = create(:station)

    visit station_path(station)

    expect(current_path).to eq('/stations/1')
    expect(page).to have_content("Station #{station.name}")
    expect(page).to have_content(station.lat)
    expect(page).to have_content(station.long)
    expect(page).to have_content(station.dock_count)
    expect(page).to have_content(station.city)
    expect(page).to have_content(station.installation_date)
  end
end
