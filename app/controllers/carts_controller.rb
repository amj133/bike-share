class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def show
    accessory_ids = @cart.contents.keys
    @accessories = accessory_ids.map  do |accessory_id|
      Accessory.find(accessory_id)
    end 
  end

  def create
    accessory = Accessory.find(params[:accessory_id])

    @cart.add_accessory(accessory.id)
    session[:cart] = @cart.contents
    flash[:notice] = "You now have #{pluralize(session[:cart][accessory.id.to_s], accessory.name)} in your cart."

    redirect_to bike_shop_path
  end

end
