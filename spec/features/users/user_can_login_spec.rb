require 'rails_helper'

describe "Existing user successfully logs in" do
  context "visits root path and clicks login" do
    it "they enter information and are logged in" do
      bob = User.create!(username: "bobrocks",
                         password: "test")

      visit root_path
      click_on("Login")
      fill_in("Username", with: "bobrocks")
      fill_in("Password", with: "test")
      click_on("Log in")

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Logged in as #{bob.username}")
      expect(page).to have_content("Username: #{bob.username}")
      expect(page).to have_content("Email: #{bob.email}")
    end
  end
end

describe "Existing user can logout" do
  context "clicks logout from their dashboard" do
    it "redirects to root" do
      bob = User.create!(username: "bobrocks",
                         password: "test")

      visit root_path
      click_on("Login")
      fill_in("Username", with: "bobrocks")
      fill_in("Password", with: "test")
      click_on("Log in")

      visit root_path
      click_on('Logout')

      expect(current_path).to eq(root_path)
      expect(page).to have_content("Login")
      expect(page).to have_content("Create Account")
    end
  end
end
