class Admin::OrdersController < Admin::BaseController

  def show
    redirect_to order_path(params[:id])
  end

end
