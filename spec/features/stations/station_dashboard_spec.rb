require 'rails_helper'

describe "user or admin visits stations dashboard" do
  it "displays station analytics" do
    bob = User.create!(username: "bob", password: "test", email: "email@gmail.com")
    create_list(:station, 3)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(bob)
    visit stations_dashboard_path

    expect(page).to have_content("Total station count: 3")
    expect(page).to have_content("Average bikes per station: #{Station.avg_bikes_per_station}")
    expect(page).to have_content("Most bikes available at a station: #{Station.most_bikes_available.dock_count}")
    expect(page).to have_content("Station with most bikes available: #{Station.most_bikes_available.name}")
    expect(page).to have_content("Fewest bikes available at a station: #{Station.fewest_bikes_available.dock_count}")
    expect(page).to have_content("Station with fewest bikes available: #{Station.fewest_bikes_available.name}")
    expect(page).to have_content("Most recently installed station: #{Station.most_recently_installed.name}")
    expect(page).to have_content("Oldest station: #{Station.oldest_station.name}")
  end
end

describe "visitor cannot visit stations dashboard" do
  it "displays 404 page" do
    visit stations_dashboard_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end
end
