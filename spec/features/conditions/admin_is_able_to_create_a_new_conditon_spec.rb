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
        expect(page).to have_content("Max temp f")
        expect(page).to have_content("Mean humidity")
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
        fill_in("Max temp f", with: 200)
        fill_in("Mean temp f", with: 200)
        fill_in("Min temp f", with: 10)
        fill_in("Mean humidity", with: 21)
        fill_in("Mean visibility miles", with: 43)
        fill_in("Mean wind speed", with: 23)
        fill_in("Precipitation inches", with: 23)
        click_button("Create Condition")


        expect(current_path).to eq condition_path(Condition.last)
        expect(page).to have_content("Condition Details")
        expect(page).to have_content(200)
        expect(page).to have_content(10)
        expect(page).to have_content("New condition created")

    end
  end
