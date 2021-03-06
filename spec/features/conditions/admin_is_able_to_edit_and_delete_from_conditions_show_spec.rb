require 'rails_helper'

describe "Admin sees condition show"  do
  it "Admin sees edit and delete button next to condition"  do
    condition = create(:condition)
    user = create(:user, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit condition_path(condition)

    expect(page).to have_content(condition.readable_date)
    expect(page).to have_link("Edit")
    expect(page).to have_link("Delete")
  end
end

describe "User sees condition show"  do
  it "User does not see edit and delete button next to condition"  do
    condition = create(:condition)
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit condition_path(condition)

    expect(page).to have_content(condition.readable_date)
    expect(page).to_not have_link("Edit")
    expect(page).to_not have_link("Delete")
  end
end

describe "Admin sees condition show"  do
  it "Admin is able to delete condition and redirected to conditions index"  do
    condition = create(:condition)
    user = create(:user, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit condition_path(condition)

    expect(page).to have_content(condition.readable_date)
    expect(page).to have_content(condition.readable_date)

    click_link("Delete")

    expect(current_path).to eq conditions_path
    expect(page).to have_content("Displaying 0 conditions")
  end
end

describe "Admin sees condition show"  do
  it "Admin is able to edit condition and then sees updated condition"  do
    condition = create(:condition)
    user = create(:user, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit condition_path(condition)

    expect(page).to have_content(condition.readable_date)
    expect(page).to have_content(condition.readable_date)

    click_link("Edit")

    expect(page).to have_content("Edit Condition")

    fill_in("condition_max_temp_f", with: 300)
    click_button("Update Condition")

    expect(page).to have_content(300)
    expect(current_path).to eq condition_path(condition)
    expect(page).to have_content("Condition Details")
  end
end
