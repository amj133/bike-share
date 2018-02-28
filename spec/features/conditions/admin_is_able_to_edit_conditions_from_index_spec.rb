require 'rails_helper'

  describe "Admin sees conditions index"  do
    it "Admin sees edit button next to conditions"  do
        condition = create(:condition)
        user = create(:user, role: 1)

        visit root_path

        click_link("Login")

        fill_in("Username", with: user.username)
        fill_in("Password", with: user.password)

        click_button("Log in")

        visit conditions_path

        expect(page).to have_content(condition.readable_date)
        expect(page).to have_link("Edit")
    end
  end

  describe "User sees condtions index"  do
    it "User does not see edit button"  do
        condition = create(:condition)
        user = create(:user)

        visit root_path

        click_link("Login")

        fill_in("Username", with: user.username)
        fill_in("Password", with: user.password)

        click_button("Log in")

        visit conditions_path


        expect(page).to have_content(condition.readable_date)
        expect(page).to_not have_link("Edit")
      end
    end

    describe "Admin see conditions index page"  do
      it "Admin clicks edit and sees edit form"  do
        condition = create(:condition)
        user = create(:user, role: 1)

        visit root_path

        click_link("Login")

        fill_in("Username", with: user.username)
        fill_in("Password", with: user.password)

        click_button("Log in")

        visit conditions_path

        expect(page).to have_content(condition.readable_date)

        click_link("Edit")

        expect(page).to_not have_content(condition.readable_date)

        expect(page).to have_content("Date")

        expect(page).to have_content("Edit Condition")
      end
    end

    describe "Admin see conditions edit page"  do
      it "Admin clicks update and sees edited condition in show"  do
        condition = create(:condition)
        user = create(:user, role: 1)

        visit root_path

        click_link("Login")

        fill_in("Username", with: user.username)
        fill_in("Password", with: user.password)

        click_button("Log in")

        visit conditions_path

        expect(page).to have_content(condition.readable_date)
        expect(page).to have_content("Displaying 1 conditions")

        click_link("Edit")

        fill_in("condition_max_temp_f", with: "200")
        fill_in("condition_mean_temp_f", with: "10")
        fill_in("condition_min_temp_f", with: "10")
        fill_in("condition_mean_humidity", with: "21")
        fill_in("condition_mean_visibility_miles", with: "43")
        fill_in("condition_mean_wind_speed", with: "23")

        click_button("Update Condition")


        expect(page).to have_content(200)
        expect(page).to have_content(10)
        expect(page).to have_content("Condition Details")

        expect(page).to have_content("Delete")
        expect(page).to have_content("Edit")

      end
    end
