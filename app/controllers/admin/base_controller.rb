class Admin::BaseController < ApplicationController
  before_action :require_admin

  private

  def require_admin
    render file: "/errors/error" unless current_admin?
  end

end
