class OrdersController < ApplicationController

  def create
    user = User.find(session[:user_id])
    @order = user.orders.create(status: "Ordered",
                      total: @cart.total_cost,
                      submitted: DateTime.now)
    @order.accessories.push(@cart.accessories)
    flash.notice = "You have successfully submitted your order."

    redirect_to dashboard_path
  end

  def show
    @order = Order.find(params[:id])
  end

end
