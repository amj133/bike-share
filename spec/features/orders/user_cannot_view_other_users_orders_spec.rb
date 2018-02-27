require 'rails_helper'

describe "user cannot access other users' orders" do
  it "redirects to a 404" do
    bob = User.create(username: "bob", password: "test", email:"bob@gmail.com")
    jane = User.create(username: "jane", password: "test", email:"jane@gmail.com")
    order_1 = bob.orders.create(status: "Completed", total: 50, updated_at: DateTime.new(2011, 9, 1), submitted: DateTime.new(2011, 8, 18))
    order_2 = jane.orders.create(status: "Cancelled", total: 60, updated_at: DateTime.new(2011, 9, 3), submitted: DateTime.new(2011, 7, 18))

    visit root_path
    click_link("Login")
    fill_in("Username", with: "bob")
    fill_in("Password", with: "test")
    click_button("Log in")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(bob)

    visit order_path(order_2)

    expect(page).to_not have_content(order_2.status)
    expect(page).to_not have_content(order_2.total)
  end
end
