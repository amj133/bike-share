class TripsDashboardController < ApplicationController

  def index
    @stats = TripsDashboardPresenter.new
  end

end
