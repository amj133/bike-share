require 'rails_helper'

describe "Admin sees conditions index"  do
  it "Admin sees delete button next to conditions"  do
    condition = create(:condition)
    user = create(:user, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit conditions_path

    expect(page).to have_content(condition.readable_date)
    expect(page).to have_link("Delete")
  end
end

describe "user sees conditions index"  do
  it "User does not see delete button"  do
    condition = create(:condition)
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit conditions_path

    expect(page).to have_content(condition.readable_date)
    expect(page).to_not have_link("Deleted")
  end
end

describe "Admin see conditions index"  do
  it "Admin is able to delete a condition"  do
    condition = create(:condition, date: DateTime.new(2009, 5, 4))
    user = create(:user, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit conditions_path

    expect(page).to have_content(condition.readable_date)

    click_link("Delete")

    expect(page).to_not have_content(condition.readable_date)
    expect(page).to have_content("Condition for #{DateTime.new(2009, 5, 4).strftime("%-m/%-d/%Y")} deleted.")
  end
end
