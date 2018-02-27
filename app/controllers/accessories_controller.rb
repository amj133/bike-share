class AccessoriesController < ApplicationController

  def index
    @accessories = Accessory.abc
  end

  def show
    @accessory = Accessory.find(params[:id])
  end

  def new
    if current_admin?
      @accessory = Accessory.new
    else
      redirect_to bike_shop_path
    end
  end

  def create
    if current_admin?
      @accessory = Accessory.new(accessory_params)
      if @accessory.save
        redirect_to admin_bike_shop_path
      else
        render :new
      end
    else
      render file: "/errors/error"
    end 
  end

  private

  def accessory_params
    params.require(:accessory).permit(:name, :description, :price, :image_path, :status)
  end

end
