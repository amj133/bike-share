class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.admin? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to admin_dashboard_path
    elsif user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      flash.notice = "User credentials not found."
      render :new
    end
  end

  def destroy
    session.destroy
    redirect_to root_path
  end

end
