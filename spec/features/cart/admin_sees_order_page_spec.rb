require 'rails_helper'

describe "admin visits order show page" do
  it "displays purchaser and order info" do
    bob = User.create(username: "bob",
                      password: "test",
                      email:"bob@gmail.com",
                      role: 1)
    order = bob.orders.create(status: "Ordered",
                         total: 335,
                         submitted: DateTime.now)
    order.accessories.create(name: 'helmet', description: "blue", price: 110)
    order.accessories.create(name: 'shoe', description: "red", price: 225)
    order.order_accessories.find(1).update(quantity: 1)
    order.order_accessories.find(2).update(quantity: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(bob)
    allow_any_instance_of(ApplicationController).to receive(:current_admin?).and_return(bob)
    visit order_path(order)

    expect(page).to have_content("Order Total: $335.00")
    expect(page).to have_content("Submitted: #{DateTime.now.utc.strftime("%l:%M %P, %-m/%-d/%Y")}")
    expect(page).to have_content("Customer: #{bob.username}")
    expect(page).to have_content("Email: #{bob.email}")
    expect(page).to have_link('helmet')
    expect(page).to have_content("Subtotal: $110.00")
    expect(page).to have_link('shoe')
    expect(page).to have_content('Subtotal: $225.00')
    expect(page).to have_content("Quantity  in Order: 2")
  end
end
