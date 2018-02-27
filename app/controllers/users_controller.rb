class UsersController < ApplicationController

  def show
    @user = User.find(session[:user_id])
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

  def edit
    @user = current_user
  end

  def update
    current_user.update(user_params)
    if current_user.save
      flash.notice = "Successfully updated #{current_user.username}'s info."
      redirect_to user_path(current_user)
    else
      flash.notice = "Couldn't update #{current_user.username}'s information."
      redirect_to edit_user_path(current_user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :first_name, :last_name, :street, :city, :state, :zipcode)
  end

end
