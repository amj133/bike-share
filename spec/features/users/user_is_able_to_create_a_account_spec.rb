require 'rails_helper'

describe "User is able to create a account" do
  describe "User visits root path" do
    it "They answer info and they are logged in" do

       visit root_path

       click_on("Sign up")

       expect(current_path).to eq(new_user_path)

       fill_in("username", "bob")
       fill_in("password", "password")
       fill_in("email", "email")

       click_on("Sign up")

       expect(current_path).to eq(user_path(User.last))
       expect(page).to have_content("Welcome #{User.last.username}")

     end
   end
 end 
