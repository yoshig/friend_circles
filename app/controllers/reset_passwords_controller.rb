class ResetPasswordsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:email])

    if user
      UserMailer.reset_password_email(user).deliver!
      redirect_to '/'
    else
      flash.now[:errors] = ["Couldn't find user with that email"]
      render :new
    end
  end

  def edit
    @user = User.find(params[:user_id])
  end
end
