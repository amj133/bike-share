require "rails_helper"

describe "user sees one condition" do
  it "displays" do
    condition = create(:condition)

    visit condition_path(condition)

    expect(page).to have_content(condition.readable_date)
    expect(page).to have_content(condition.max_temp_f)
    expect(page).to have_content(condition.mean_temp_f)
    expect(page).to have_content(condition.min_temp_f)
    expect(page).to have_content(condition.mean_humidity)
    expect(page).to have_content(condition.mean_visibility_miles)
    expect(page).to have_content(condition.mean_wind_speed)
    expect(page).to have_content(condition.precipitation_inches)
  end
end
