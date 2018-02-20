class ConditionsController < ApplicationController
 def index
   @conditions = Condition.all
 end

 def show
   @condition = Condition.find(params[:id])
 end

 def destroy
   @condition = Condition.find(params[:id])
   @condition.destroy
   flash.notice = "Condition deleted."
   redirect_to conditions_path
 end

end
