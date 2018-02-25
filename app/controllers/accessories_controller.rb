class AccessoriesController < ApplicationController

  def index
    @accessories = Accessory.all
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
    @accessory = Accessory.new(accessory_params)
    if @accessory.save
      redirect_to admin_bike_shop_path
    else
      render :new
    end
    #need to gate from non-admin?
  end

  private

  def accessory_params
    params.require(:accessory).permit(:name, :description, :price, :image_path)
  end

end
