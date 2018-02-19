require 'rails_helper'

describe "user or admin visits stations dashboard" do
  it "displays station analytics" do
    create_list(:station, 3)

    visit stations_dashboard_path

    expect(page).to have_content("Total station count: 3")
    expect(page).to have_content("Average bikes per station: #{Station.avg_bikes_per_station}")
    expect(page).to have_content("Most bikes available at a station: #{Station.most_bikes_available.dock_count}")
    expect(page).to have_content("Station with most bikes available: #{Station.most_bikes_available.name}")
    expect(page).to have_content("Fewest bikes available at a station: #{Station.fewest_bikes_available.dock_count}")
    expect(page).to have_content("Station with fewest bikes available: #{Station.fewest_bikes_available.name}")
    expect(page).to have_content("Most recently installed station: #{Station.most_recently_installed.name}")
  end
end
