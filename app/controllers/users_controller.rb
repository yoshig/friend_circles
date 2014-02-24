class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:token] = @user.reset_token!
      redirect_to "/"
    else
      flash.now[:errors] = @user.errors.full_messages
      render "new"
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to '/'
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to edit_user_reset_password_url(@user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
