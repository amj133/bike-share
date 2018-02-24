require 'rails_helper'

  describe "Admin sees conditions index"  do
    it "Admin sees delete button next to conditions"  do
        condition = create(:condition)
        user = User.create(username: "Kyle", email: "email",
        password: "password" ,role: 1)

        visit root_path

        click_link("Login")

        fill_in("Username", with: "Kyle")
        fill_in("Password", with: "password")

        click_button("Log in")

        visit conditions_path


        expect(page).to have_content(condition.readable_date)
        expect(page).to have_link("Delete")


    end
  end
  describe "user sees conditions index"  do
    it "User does not see delete button"  do
        condition = create(:condition)
        user = User.create(username: "Kyle", email: "email",
        password: "password")

        visit root_path

        click_link("Login")

        fill_in("Username", with: "Kyle")
        fill_in("Password", with: "password")

        click_button("Log in")

        visit conditions_path


        expect(page).to have_content(condition.readable_date)
        expect(page).to_not have_link("Deleted")
      end
    end

    describe "Admin see conditions index"  do
      it "Admin is able to delete a condition"  do
        condition = create(:condition)
        user = User.create(username: "Kyle", email: "email",
        password: "password", role: 1)

        visit root_path

        click_link("Login")

        fill_in("Username", with: "Kyle")
        fill_in("Password", with: "password")

        click_button("Log in")

        visit conditions_path

        expect(page).to have_content(condition.readable_date)

        click_link("Delete")

        expect(page).to_not have_content(condition.readable_date)
        expect(page).to have_content("Condition deleted.")
      end
    end
