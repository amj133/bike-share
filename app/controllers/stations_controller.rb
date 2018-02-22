class StationsController < ApplicationController
  before_action :require_current_user, only: [:dashboard]

  def index
    @stations = Station.all
  end

  def show
    @station = Station.find_by(slug: params[:slug])
  end

  def dashboard
    @stations = Station.all
  end

  private

  def require_current_user
    render file: '/public/404' unless current_user
  end

end
