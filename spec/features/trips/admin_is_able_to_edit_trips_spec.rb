require 'rails_helper'


  describe "Admin sees trip index"  do
    it "Admin sees edit button next to trip"  do
      station = create(:station)
      trip = create(:trip, start_station_id: station.id, end_station_id: station.id)
      user = create(:user, role: 1)

      visit root_path

      click_link("Login")

      fill_in("Username", with: user.username)
      fill_in("Password", with: user.password)

      click_button("Log in")

      visit trips_path

      expect(page).to have_link("Edit")
    end
  end

  describe "Admin sees trip index"  do
    it "Admin clicks edit and sees edit page"  do
      station = create(:station)
      trip = create(:trip, start_station_id: station.id, end_station_id: station.id)
      user = create(:user, role: 1)

      visit root_path

      click_link("Login")

      fill_in("Username", with: user.username)
      fill_in("Password", with: user.password)

      click_button("Log in")

      visit trips_path

      click_link("Edit")

      expect(page).to have_content("Edit Trip")
      expect(page).to have_content("Duration")
      expect(page).to have_content("Start station")
      expect(page).to have_content("Zipcode")
    end
  end

  describe "Admin sees trip index"  do
    it "Admin clicks edit and sees edit page and is able to edit info"  do
      station = create(:station)
      trip = create(:trip, start_station_id: station.id, end_station_id: station.id)
      user = create(:user, role: 1)

      visit root_path

      click_link("Login")

      fill_in("Username", with: user.username)
      fill_in("Password", with: user.password)

      click_button("Log in")

      visit trips_path

      click_link("Edit")

      expect(page).to have_content("Edit Trip")

      fill_in('trip_duration', with: '666')
      fill_in('Zipcode', with: '32218')
      select(trip.subscription, :from => 'Subscription')

      click_button("Update Trip")

      expect(page).to have_content(Time.at(666 * 60).utc.strftime("%k hrs %M min"))
      expect(page).to have_content(32218)
      expect(page).to have_content(trip.subscription)
    end
  end
