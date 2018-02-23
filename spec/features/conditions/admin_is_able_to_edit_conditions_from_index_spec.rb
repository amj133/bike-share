require 'rails_helper'

  describe "Admin sees conditions index"  do
    it "Admin sees edit button next to conditions"  do
        condition = create(:condition)
        user = User.create(username: "Kyle", email: "email",
        password: "password" ,role: 1)

        visit root_path

        click_link("Login")

        fill_in("Username", with: "Kyle")
        fill_in("Password", with: "password")

        click_button("Log in")

        visit conditions_path


        expect(page).to have_content(condition.date)
        expect(page).to have_link("Edit")
    end
  end

  describe "User sees condtions index"  do
    it "User does not see edit button"  do
        condition = create(:condition)
        user = User.create(username: "Kyle", email: "email",
        password: "password")

        visit root_path

        click_link("Login")

        fill_in("Username", with: "Kyle")
        fill_in("Password", with: "password")

        click_button("Log in")

        visit conditions_path


        expect(page).to have_content(condition.date)
        expect(page).to_not have_link("Edit")
      end
    end

    describe "Admin see conditions index page"  do
      it "Admin clicks edit and sees edit form"  do
        condition = create(:condition)
        user = User.create(username: "Kyle", email: "email",
        password: "password", role: 1)

        visit root_path

        click_link("Login")

        fill_in("Username", with: "Kyle")
        fill_in("Password", with: "password")

        click_button("Log in")

        visit conditions_path

        expect(page).to have_content(condition.date)

        click_link("Edit")


        expect(page).to have_content("Date")
        expect(page).to have_content("Edit Conditions")
      end
    end

    describe "Admin see conditions edit page"  do
      it "Admin clicks update and sees edited condition in show"  do
        condition = create(:condition)
        user = User.create(username: "Kyle", email: "email",
        password: "password", role: 1)

        visit root_path

        click_link("Login")

        fill_in("Username", with: "Kyle")
        fill_in("Password", with: "password")

        click_button("Log in")

        visit conditions_path

        expect(page).to have_content("Displaying 1 conditions")

        click_link("Edit")

        fill_in("Max temp f", with: "200")
        fill_in("Min temp f", with: "10")
        fill_in("Max dewpoint f", with: "23")
        fill_in("Mean dewpoint f", with: "34")
        fill_in("Max humidity", with: "35")
        fill_in("Mean humidity", with: "21")
        fill_in("Max sea level pressure inches", with: "12")
        fill_in("Min sea level pressure inches", with: "56")
        fill_in("Mean visibility miles", with: "43")
        fill_in("Min visibility miles", with: "34")
        fill_in("Mean wind speed", with: "23")
        fill_in("Cloud cover", with: "12")
        fill_in("Events", with: "12")
        fill_in("Zipcode", with: "32218")

        click_button("Update Condition")

  
        expect(page).to have_content(200)
        expect(page).to have_content(10)
        expect(page).to have_content("Condition details")

        expect(page).to have_content("Delete")
        expect(page).to have_content("Edit")

      end
    end
