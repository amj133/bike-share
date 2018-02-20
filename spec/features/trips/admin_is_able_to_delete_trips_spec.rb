require 'rails_helper'

  describe "Admin sees trip index"  do
    it "Admin sees delete button next to trip"  do
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

        visit trips_path

       expect(page).to have_link("Delete")
    end
  end

  describe "User sees trip index"  do
    it "User does not see delete button"  do
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

        visit trips_path


        expect(page).to have_content(trip.zipcode)
        expect(page).to_not have_link("Deleted")
      end
    end

    describe "Admin see trip index"  do
      it "Admin is able to delete a trip"  do
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

        visit trips_path

        expect(page).to have_content(trip.zipcode)

        click_link("Delete")

        expect(page).to have_content("Trip deleted.")
        expect(page).to_not have_content("Delete")
      end
    end
