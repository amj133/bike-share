require "rails_helper"

describe "visitor sees conditions index" do
  it "it displays a list of all conditions" do
    condition_1 = create(:condition)
    condition_2 = create(:condition)
    condition_3 = create(:condition)
    condition_4 = create(:condition)

    visit conditions_path

    expect(page).to have_content(condition_1.readable_date)
    expect(page).to have_content(condition_1.max_temp_f)
    expect(page).to have_content(condition_1.mean_temp_f)
    expect(page).to have_content(condition_1.min_temp_f)
    expect(page).to have_content(condition_1.mean_humidity)
    expect(page).to have_content(condition_1.mean_visibility_miles)
    expect(page).to have_content(condition_1.mean_wind_speed)
    expect(page).to have_content(condition_1.precipitation_inches)
    expect(page).to have_content(condition_2.precipitation_inches)
    expect(page).to have_content(condition_3.mean_wind_speed)
    expect(page).to have_content(condition_4.min_temp_f)
  end
end
