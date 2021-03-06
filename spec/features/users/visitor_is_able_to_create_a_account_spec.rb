require 'rails_helper'

describe "visitor is able to create a account" do
  describe "visits root path" do
    it "they answer info and they are logged in" do
       visit root_path

       click_on("Login")

       expect(current_path).to eq(login_path)

       click_on("Create Account")
       fill_in("Username", with: "pal")
       fill_in("Password", with: "password")
       fill_in("Email", with: "email@email.com")
       fill_in("First name", with: "Bob" )
       fill_in("Last name", with: "Bobson" )
       fill_in("Street", with: "123 Fake St" )
       fill_in("City", with: "Nowhere" )
       select("Colorado", from: "State")
       fill_in("Zipcode", with: "12345" )
       click_on("Submit")

       expect(page).to have_content("Welcome, #{User.last.username.capitalize}")
       expect(page).to have_content("Logged in as #{User.last.username}")
       expect(page).to have_link("Logout")
    end

    it "User uses existing username and is redirected to new path" do
      user = User.create!(username: "bob", password: "password", email: "email@gmail.com")

      visit root_path
      click_on("Login")

      expect(current_path).to eq(login_path)

      click_on("Create Account")
      fill_in("Username", with: "bob")
      fill_in("Password", with: "password")
      fill_in("Email", with: "email@gmail.com")
      click_on("Submit")

      expect(page).to have_content("Couldn't create account.")
      expect(page).to have_button("Submit")
    end
  end
end
