require 'rails_helper'

  describe "Admin sees condition show"  do
    it "Admin sees edit and delete button next to condition"  do
        condition = create(:condition)
        user = User.create(username: "Kyle", email: "email",
        password: "password" ,role: 1)

        visit root_path

        click_link("Login")

        fill_in("Username", with: "Kyle")
        fill_in("Password", with: "password")

        click_button("Log in")

        visit condition_path(condition)


        expect(page).to have_content(condition.date)
        expect(page).to have_link("Edit")
        expect(page).to have_link("Delete")
    end
  end

  describe "User sees condition show"  do
    it "User does not see edit and delete button next to condition"  do
        condition = create(:condition)
        user = User.create(username: "Kyle", email: "email",
        password: "password")

        visit root_path

        click_link("Login")

        fill_in("Username", with: "Kyle")
        fill_in("Password", with: "password")

        click_button("Log in")

        visit condition_path(condition)


        expect(page).to have_content(condition.date)
        expect(page).to_not have_link("Edit")
        expect(page).to_not have_link("Delete")
    end
  end

  require 'rails_helper'

    describe "Admin sees condition show"  do
      it "Admin is able to delete condition and redirected to conditions index"  do
          condition = create(:condition)
          user = User.create(username: "Kyle", email: "email",
          password: "password" ,role: 1)

          visit root_path

          click_link("Login")

          fill_in("Username", with: "Kyle")
          fill_in("Password", with: "password")

          click_button("Log in")

          visit condition_path(condition)


          expect(page).to have_content(condition.date)

          expect(page).to have_content(condition.date)

          click_link("Delete")

          expect(current_path).to eq conditions_path
          expect(page).to have_content("Displaying 0 conditions")
      end
    end

    describe "Admin sees condition show"  do
      it "Admin is able to edit condition and then sees updated condition"  do
          condition = create(:condition)
          user = User.create(username: "Kyle", email: "email",
          password: "password" ,role: 1)

          visit root_path

          click_link("Login")

          fill_in("Username", with: "Kyle")
          fill_in("Password", with: "password")

          click_button("Log in")

          visit condition_path(condition)


          expect(page).to have_content(condition.date)

          expect(page).to have_content(condition.date)

          click_link("Edit")

          expect(page).to have_content("Edit Conditions")
          fill_in("Max temp f", with: "300")

          click_button("Update Condition")

          expect(page).to have_content("Displaying 1 conditions")
          expect(page).to have_content(300)
          expect(current_path).to eq conditions_path
      end
    end
