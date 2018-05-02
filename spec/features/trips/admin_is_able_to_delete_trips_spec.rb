require 'rails_helper'

  describe "Admin sees trip index"  do
    it "Admin sees delete button next to trip"  do
      station = create(:station)
      trip = create(:trip, start_station_id: station.id, end_station_id: station.id)
      user = create(:user, role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit trips_path

      expect(page).to have_link("Delete")
    end
  end

  describe "User sees trip index"  do
    it "User does not see delete button"  do
      station = create(:station)
      trip = create(:trip, start_station_id: station.id, end_station_id: station.id)
      user = create(:user, role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit trips_path

      expect(page).to have_content(trip.zipcode)
      expect(page).to_not have_link("Deleted")
    end
  end

  describe "Admin see trip index"  do
    it "Admin is able to delete a trip"  do
      station = create(:station)
      trip = create(:trip, start_station_id: station.id, end_station_id: station.id)
      user = create(:user, role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit trips_path

      expect(page).to have_content(trip.zipcode)

      click_link("Delete")

      expect(page).to have_content("Trip #{trip.id} deleted.")
      expect(page).to_not have_content("Delete")
    end
  end
