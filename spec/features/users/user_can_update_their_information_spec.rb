require "rails_helper"

describe "user visits edit page from their show" do
  it "allows them to update their data" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_on "Log in"

    visit user_path(user)
    click_on "Update Profile"

    expect(current_path).to eq(edit_user_path(user))

    fill_in("Email", with: "email@email.com")
    fill_in("First name", with: "Bob" )
    fill_in("Last name", with: "Bobson" )
    fill_in("Street", with: "123 Fake St" )
    fill_in("City", with: "Nowhere" )
    select("Colorado", from: "State")
    fill_in("Zipcode", with: "12345" )
    click_on("Submit")

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Successfully updated #{user.username}'s info.")
    expect(page).to have_content("Bob")
    expect(page).to have_content("Bobson")
    expect(page).to have_content("123 Fake St")
    expect(page).to have_content("Nowhere")
    expect(page).to have_content("CO")
    expect(page).to have_content("12345")
  end
end
