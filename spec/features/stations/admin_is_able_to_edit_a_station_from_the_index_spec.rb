require 'rails_helper'

  describe "Admin sees station index"  do
    it "Admin sees edit button next to station"  do
        station = create(:station)
        user = User.create(username: "Kyle", email: "email",
        password: "password" ,role: 1)

        visit root_path

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit stations_path

        expect(page).to have_content(station.name)
        expect(page).to have_link("Edit")

    end
  end

  describe "user sees station index"  do
    it "User does not see edit button"  do
        station = create(:station)
        user = User.create(username: "Kyle", email: "email",
        password: "password")

        visit root_path

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit stations_path

        expect(page).to have_content(station.name)
        expect(page).to_not have_link("Edit")
      end
    end

    describe "Admin sees station index"  do
      it "Admin clicks edit button and is taken to edit form"  do
        station = create(:station, id: 1)
          trip = create(:trip, start_station_id: 1, end_station_id: 1)

          user = User.create(username: "Kyle", email: "email",
          password: "password" ,role: 1)

          visit root_path

          allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

          visit stations_path

          click_link("Edit")

          fill_in("Name", with: "Big Bike")
          fill_in("Lat", with: 12345)
          fill_in("Long", with: 54321)
          fill_in("Dock count", with: 23)
          fill_in("City", with: "Jacksonville")

          click_button("Update Station")

          expect(current_path).to eq station_path("big-bike")
        
          expect(page).to have_content("Big Bike")
          expect(page).to have_content(12345)
          expect(page).to have_content(54321)
          expect(page).to have_content(23)
          expect(page).to have_content("Jacksonville")
      end
    end
