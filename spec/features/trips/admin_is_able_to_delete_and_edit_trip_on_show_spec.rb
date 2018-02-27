require 'rails_helper'

  describe "Admin sees trip show"  do
    it "Admin sees delete and edit button next to trip"  do
      station = Station.create!(name: "Big Bikes", lat: 123456, long:223523, dock_count:22, city:"denver" ,installation_date: Time.now)
      trip = Trip.create!(duration: 73, start_date: Time.now, start_station_id: 1,
                          end_date: Time.now, end_station_id: 1, bike_id: 22, subscription: "Subscriber",
                          zipcode: 32218)
      user = User.create(username: "Kyle", email: "email",
                          password: "password" ,role: 1)

        visit root_path

        click_link("Login")

        fill_in("Username", with: "Kyle")
        fill_in("Password", with: "password")

        click_button("Log in")

        visit trip_path(trip)

       expect(page).to have_link("Delete")
       expect(page).to have_link("Edit")
    end
  end

  describe "User sees trip show"  do
    it "User does not see delete and edit button next to trip"  do
      station = Station.create!(name: "Big Bikes", lat: 123456, long:223523, dock_count:22, city:"denver" ,installation_date: Time.now)
      trip = Trip.create!(duration: 73, start_date: Time.now, start_station_id: 1,
                          end_date: Time.now, end_station_id: 1, bike_id: 22, subscription: "Subscriber",
                          zipcode: 32218)
      user = User.create(username: "Kyle", email: "email",
                          password: "password")

        visit root_path

        click_link("Login")

        fill_in("Username", with: "Kyle")
        fill_in("Password", with: "password")

        click_button("Log in")

        visit trip_path(trip)

       expect(page).to_not have_link("Delete")
       expect(page).to_not have_link("Edit")
    end
  end

  describe "Admin see trip show"  do
    it "Admin is able to delete trip"  do
      station = Station.create!(name: "Big Bikes", lat: 123456, long:223523, dock_count:22, city:"denver" ,installation_date: Time.now)
      trip = Trip.create!(duration: 73, start_date: Time.now, start_station_id: 1,
                          end_date: Time.now, end_station_id: 1, bike_id: 22, subscription: "Subscriber",
                          zipcode: 32218)
      user = User.create(username: "Kyle", email: "email",
      password: "password", role: 1)

      visit root_path

      click_link("Login")

      fill_in("Username", with: "Kyle")
      fill_in("Password", with: "password")

      click_button("Log in")

      visit trip_path(trip)

      expect(page).to have_content(trip.zipcode)

      click_link("Delete")

      expect(page).to have_content("Trip #{trip.id} deleted.")
      expect(page).to_not have_content("Delete")
      expect(page).to_not have_content(trip.zipcode)
      expect(page).to_not have_content(trip.duration)
    end
  end

  describe "Admin sees trip show"  do
    it "Admin clicks edit and sees edit page and is able to edit info"  do
      station = Station.create!(name: "Big Bikes", lat: 123456, long:223523, dock_count:22, city:"denver" ,installation_date: Time.now)
      trip = Trip.create!(duration: 73, start_date: Time.now, start_station_id: 1,
                          end_date: Time.now, end_station_id: 1, bike_id: 22, subscription: "Subscriber",
                          zipcode: 32218)
      user = User.create(username: "Kyle", email: "email",
                          password: "password" ,role: 1)

        visit root_path

        click_link("Login")

        fill_in("Username", with: "Kyle")
        fill_in("Password", with: "password")

        click_button("Log in")

        visit trip_path(trip)

        click_link("Edit")

        expect(page).to have_content("Edit Trip")

        fill_in('trip_duration', with: '120')
        fill_in('Zipcode', with: '32218')
        select('Subscriber', from: 'Subscription')

        click_button("Update Trip")

        expect(page).to have_content(Time.at( 120 * 60).utc.strftime("%k hrs %M min"))
        expect(page).to have_content(32218)
        expect(page).to have_content("Subscriber")
    end
  end
