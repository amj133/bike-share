require 'rails_helper'

describe "user or admin visits stations dashboard" do
  it "displays station analytics" do
    create_list(:station, 3)

    visit stations_dashboard_path

    expect(page).to have_content("Total station count: 3")
    expect(page).to have_content("Average bikes per station: #{Station.avg_bikes_per_station}")
  end
end
