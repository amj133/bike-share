require 'rails_helper'

  describe "Admin sees station index"  do
    it "Admin sees delete button next to station"  do
        station = create(:station)
        user = User.create(username: "Kyle", email: "email",
        password: "password" ,role: 1)

        visit root_path

        click_link("Login")

        fill_in("Username", with: "Kyle")
        fill_in("Password", with: "password")

        click_button("Log in")

        visit stations_path


        expect(page).to have_content(station.name)
        expect(page).to have_link("Delete")


    end
  end
  describe "user sees station index"  do
    it "User does not see delete button"  do
        station = create(:station)
        user = User.create(username: "Kyle", email: "email",
        password: "password")

        visit root_path

        click_link("Login")

        fill_in("Username", with: "Kyle")
        fill_in("Password", with: "password")

        click_button("Log in")

        visit stations_path

        expect(page).to have_content(station.name)
        expect(page).to_not have_link("Deleted")
      end
    end

    describe "Admin see station index"  do
      it "Admin is able to delete a station"  do
        station = create(:station)
        user = User.create(username: "Kyle", email: "email",
        password: "password", role: 1)

        visit root_path

        click_link("Login")

        fill_in("Username", with: "Kyle")
        fill_in("Password", with: "password")

        click_button("Log in")

        visit stations_path

        expect(page).to have_content(station.name)

        click_link("Delete")

        expect(page).to have_content("Station #{station.name} deleted.")
        expect(page).to_not have_content("Delete")
      end
    end
