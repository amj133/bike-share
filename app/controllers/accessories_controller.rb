class AccessoriesController < ApplicationController

  def index
    @accessories = Accessory.all
    @cart = Cart.new(session[:cart])
  end

end
