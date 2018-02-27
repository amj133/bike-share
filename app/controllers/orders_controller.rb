class OrdersController < ApplicationController

  def create
    if current_user
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
    else
      flash.notice = "Must be logged in to checkout!"
      redirect_to login_path
    end
  end

  def show
    if current_user.orders.map {|order| order.id}.include?(params[:id].to_i)
      @order = Order.find(params[:id])
    else
      render file: '/public/404'
    end
  end

end
