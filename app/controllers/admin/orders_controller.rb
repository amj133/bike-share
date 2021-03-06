class Admin::OrdersController < Admin::BaseController

  def index
    @orders = Order.where(params[:status])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(status: params[:status])

    redirect_to admin_dashboard_path
  end

end
