require 'rails_helper'


  describe "Admin sees trip index"  do
    it "Admin sees edit button next to trip"  do
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

       expect(page).to have_link("Edit")
    end
  end

  describe "Admin sees trip index"  do
    it "Admin clicks edit and sees edit page"  do
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

        click_link("Edit")

        expect(page).to have_content("Edit Trip")
        expect(page).to have_content("Duration")
        expect(page).to have_content("Start station")
        expect(page).to have_content("Zipcode")
    end
  end

  describe "Admin sees trip index"  do
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

        visit trips_path

        click_link("Edit")

        expect(page).to have_content("Edit Trip")

        fill_in('Duration', with: '666')
        fill_in('Zipcode', with: '32218')
        fill_in('Subscription', with: 'Subscriber')

        click_button("Update Trip")

        expect(page).to have_content(Time.at(666 * 60).utc.strftime("%k hrs %M min"))
        expect(page).to have_content(32218)
        expect(page).to have_content("Subscriber")
    end
  end
