require 'rails_helper'

  describe "User sees conditions index"  do
    it "User sees delete button next to conditions"  do
        condition = create(:condition)

        visit conditions_path


        expect(page).to have_content(condition.date)
        expect(page).to have_link("Delete")
    end
  end
  describe "User sees conditions index"  do
    it "User is able to delete a condition from index"  do
        condition = create(:condition)

        visit conditions_path

         click_link("Delete")

        expect(page).to_not have_content(condition.date)
        expect(page).to have_content("Condition deleted")
      end
    end
