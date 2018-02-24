class OrdersController < ApplicationController

  def create
    user = User.find(session[:user_id])
    @order = user.orders.create(status: "Ordered",
                                total: @cart.total_cost,
                                submitted: DateTime.now)
    session[:cart].map do |accessory_id, quantity|
      @order.order_accessories.create(accessory_id: accessory_id.to_i,
                                      order_id: @order.id,
                                      quantity: quantity )
    end

    flash.notice = "You have successfully submitted your order."
    session[:cart] = Hash.new(0)
    @cart.contents = Hash.new(0)

    redirect_to dashboard_path
  end

  def show
    @order = Order.find(params[:id])
  end

end
