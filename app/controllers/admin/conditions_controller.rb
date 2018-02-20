class Admin::ConditionsController < Admin::BaseController

  def destroy
    @condition = Condition.find(params[:id])
    @condition.destroy
    flash.notice = "Condition deleted."
    redirect_to conditions_path
  end

end
