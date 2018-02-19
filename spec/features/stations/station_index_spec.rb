require 'rails_helper'

describe "visitor goes to trip index" do
  it "they see list of all stations with attributes" do
    create(:station)
    create(:station)

    visit stations_path

    expect(page).to have_content("List of all stations")
    expect(page).to have_content(Station.first.name)
    expect(page).to have_content(Station.first.dock_count)
    expect(page).to have_content(Station.first.city)
    expect(page).to have_content(Station.first.installation_date)
    expect(page).to have_content(Station.last.name)
  end
end
