class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def show
    accessory_ids = @cart.contents.select {|k, v| v > 0}.keys
    @accessories = accessory_ids.map  do |accessory_id|
      Accessory.find(accessory_id)
    end
    @cart_total = @cart.total_cost
  end

  def create
    accessory = Accessory.find(params[:accessory_id])

    @cart.add_accessory(accessory.id)
    session[:cart] = @cart.contents
    flash[:notice] = "You now have #{pluralize(session[:cart][accessory.id.to_s], accessory.name)} in your cart."

    redirect_to bike_shop_path
  end

  def increase
    @cart.add_accessory(params[:accessory_id])

    redirect_to cart_path
  end

  def decrease
    @cart.decrease_accessory(params[:accessory_id])

    redirect_to cart_path
  end

  def remove
    accessory = Accessory.find(params[:accessory_id])
    @cart.remove_accessory(params[:accessory_id])
    flash[:notice] = "Successfully removed #{view_context.link_to(accessory.name, accessory_path(accessory))} from your cart.".html_safe

    redirect_to cart_path
  end

end
