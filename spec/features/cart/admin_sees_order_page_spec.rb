require 'rails_helper'

describe "admin visits order show page" do
  it "displays purchaser and order info" do
    accessory_1 = create(:accessory, price: 110)
    accessory_2 = create(:accessory, price: 225)
    bob = User.create(username: "bob",
                      password: "test",
                      email:"bob@gmail.com",
                      role: 1)
    order = bob.orders.create(status: "Ordered",
                         total: 335,
                         submitted: DateTime.now)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(bob)
    allow_any_instance_of(ApplicationController).to receive(:current_admin?).and_return(bob)
    visit admin_order_path(order)

    expect(current_path).to eq(order_path(order))
    expect(current_path).to eq('/admin/orders/1')
    expect(page).to have_content("Order Total: 335")
    expect(page).to have_content("Submitted: #{DateTime.now.utc.strftime("%l:%M %P, %-m/%-d/%Y")}")
    expect(page).to have_content("Purchaser: #{bob.name}")
    # expect(page).to have_content("Purchaser: #{bob.address???}")
    expect(page).to have_link(accessory_1.name)
    expect(page).to have_link("Subtotal: 110")
    expect(page).to have_link(accessory_2.name)
    expect(page).to have_link("Subtotal: 225")
    expect(page).to have_link("Quantity: 2")
  end
end
