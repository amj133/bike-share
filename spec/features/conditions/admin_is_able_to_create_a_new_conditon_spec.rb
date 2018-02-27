require 'rails_helper'

  describe "Admin sees conditions index"  do
    it "Admin sees delete button next to conditions"  do
        condition = create(:condition)
        user = User.create(username: "Kyle", email: "email",
        password: "password" ,role: 1)

        visit root_path

        click_link("Login")

        fill_in("Username", with: "Kyle")
        fill_in("Password", with: "password")

        click_button("Log in")

        visit new_admin_condition_path

        expect(page).to have_content("New Condition")
        expect(page).to have_content("Date")
        expect(page).to have_content("High temperature")
        expect(page).to have_content("Average humidity")
    end
  end

  describe "Admin new conditions form"  do
    it "Admin submits new conditions form and sees new form"  do
        condition = create(:condition)
        user = User.create(username: "Kyle", email: "email",
        password: "password" ,role: 1)

        visit root_path

        click_link("Login")

        fill_in("Username", with: "Kyle")
        fill_in("Password", with: "password")

        click_button("Log in")

        visit new_admin_condition_path
        fill_in("Date", with: DateTime.new(2009, 5, 4))
        fill_in("condition_max_temp_f", with: "200")
        fill_in("condition_mean_temp_f", with: "10")
        fill_in("condition_min_temp_f", with: "10")
        fill_in("condition_mean_humidity", with: "21")
        fill_in("condition_mean_visibility_miles", with: "43")
        fill_in("condition_mean_wind_speed", with: "23")
        fill_in("condition_precipitation_inches", with: 23)
        click_button("Create Condition")


        expect(current_path).to eq condition_path(Condition.last)
        expect(page).to have_content("Condition Details")
        expect(page).to have_content(200)
        expect(page).to have_content(10)
        expect(page).to have_content("Condition for #{DateTime.new(2009, 5, 4).strftime("%-m/%-d/%Y")} created")
    end
  end
