class OrdersController < ApplicationController

  def create
    if session[:cart].nil? || session[:cart].values.sum == 0
      flash.notice = "No accessories in your cart!"
      redirect_to bike_shop_path
    elsif current_user && !current_user.shipping_info.any? {|attr| attr == nil || attr == ""}
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
    elsif current_user
      flash.notice = "Missing shipping information!"
      redirect_to edit_user_path(current_user)
    else
      flash.notice = "Must be logged in to checkout!"
      redirect_to login_path
    end
  end

  def show
    if current_user.orders.map {|order| order.id}.include?(params[:id].to_i) || current_user.admin?
      @order = Order.find(params[:id])
    else
      render file: '/errors/error'
    end
  end

end
