class ConditionsController < ApplicationController
  before_action :require_current_user, only: [:dashboard]
 def index
   @conditions = Condition.all
 end

 def show
   @condition = Condition.find(params[:id])
 end

 def dashboard
   @conditions = Condition.all
 end

 private

 def require_current_user
   render file: '/public/404' unless current_user
 end

end
