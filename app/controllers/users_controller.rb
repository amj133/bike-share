class UsersController < ApplicationController

  def show
    @user = User.find(session[:user_id])
    unless session[:cart].nil?
      flash.notice = "You have successfully submitted your order."
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash.notice = "Logged in as #{@user.username}"
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      flash.notice = "#{@user.username} already exists"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
