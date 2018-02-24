class Admin::AccessoriesController < Admin::BaseController

  def index
    @accessories = Accessory.all
  end

  def edit
    @accessory = Accessory.find(params[:id])
  end

  def update
    @accessory = Accessory.find(params[:id])
    @accessory.update(accessory_params)

    redirect_to admin_bike_shop_path
  end

  private

  def accessory_params
    params.require(:accessory).permit(:name, :description, :price, :status)
  end

end
