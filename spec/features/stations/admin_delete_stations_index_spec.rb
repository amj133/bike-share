require 'rails_helper'

  describe "Admin sees station index"  do
    it "Admin sees delete button next to station"  do
        station = create(:station)
        user = create(:user, role: 1)

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit stations_path

        expect(page).to have_content(station.name)
        expect(page).to have_link("Delete")
    end
  end

  describe "user sees station index"  do
    it "User does not see delete button"  do
        station = create(:station)
        user = create(:user)

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit stations_path

        expect(page).to have_content(station.name)
        expect(page).to_not have_link("Deleted")
      end
    end

    describe "Admin see station index"  do
      it "Admin is able to delete a station"  do
        station = create(:station)
        user = create(:user, role: 1)

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit stations_path

        expect(page).to have_content(station.name)

        click_link("Delete")

        expect(page).to have_content("Station #{station.name} deleted.")
        expect(page).to_not have_content("Delete")
      end
    end
