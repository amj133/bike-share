require 'rails_helper'

  describe "Admin sees trip new page"  do
    it "Admin sees form to create a new trip"  do
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

        visit new_admin_trip_path

       expect(page).to have_content("Duration")
       expect(page).to have_content("Start date")
       expect(page).to have_content("Start station")
       expect(page).to have_content("End date")
       expect(page).to have_content("End station")
       expect(page).to have_content("Bike")
       expect(page).to have_content("Subscription")
       expect(page).to have_content("Zipcode")

    end
  end

  describe "Admin sees trip new form"  do
    it "Admin creates new trip and is redirected to show page"  do
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

        visit new_admin_trip_path

        fill_in("Duration", with: 420)
        fill_in("Start date", with: "12345")
        select("Big Bikes", :from => "trip[start_station_id]")
        fill_in("End date", with: "12456")
        select("Big Bikes", :from => "trip[end_station_id]")
        fill_in("Bike", with: "111")
        select("Subscriber", :from => "trip[subscription]")
        fill_in("Zipcode", with: "32218")

        click_button("Create Trip")

        expect(page).to have_content("Trip Details")
        expect(page).to have_content("New trip created")
        expect(page).to have_content("Subscriber")
        expect(page).to have_content("32218")
        expect(page).to have_content("111")

    end
  end
