require "rails_helper"

describe "user tries to place order without shipping information" do
  it "redirects them to update their info with shipping info" do
    user = User.create(username: "Bob", password: "password", email: "donald@duck.com")
    create(:accessory)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_on "Log in"

    visit bike_shop_path
    click_on "Add to cart"
    visit cart_path
    click_on "Checkout"

    expect(current_path).to eq(edit_user_path(user))
    expect(page).to have_content("Missing shipping information!")
  end
end
