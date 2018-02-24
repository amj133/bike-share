class Admin::OrdersController < Admin::BaseController

  def index
    @orders = Order.where(params[:status])
  end

end
