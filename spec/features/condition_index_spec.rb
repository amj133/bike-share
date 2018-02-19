require "rails_helper"

describe "visitor sees conditions index" do
  it "it displays a list of all conditions" do
    condition_1 = create(:condition)
    condition_2 = create(:condition)
    condition_3 = create(:condition)
    condition_4 = create(:condition)

    visit conditions_path

    expect_page.to have_content(condition_1.date)
    expect_page.to have_content(condition_1.max_temp_f)
    expect_page.to have_content(condition_1.mean_temp_f)
    expect_page.to have_content(condition_1.min_temp_f)
    expect_page.to have_content(condition_1.mean_humidity)
    expect_page.to have_content(condition_1.mean_visibility_miles)
    expect_page.to have_content(condition_1.mean_wind_speed)
    expect_page.to have_content(condition_1.precipitation_inces)
    expect_page.to have_content(condition_2.precipitation_inces)
    expect_page.to have_content(condition_3.mean_wind_speed)
    expect_page.to have_content(condition_4.min_temp_f)
  end
end
