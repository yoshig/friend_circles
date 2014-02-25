class ResetPasswordsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:email])

    if user
      new_password = SecureRandom.urlsafe_base64
      user.password=(new_password)
      user.save
      UserMailer.reset_password_email(user, new_password).deliver!
      redirect_to '/'
    else
      flash.now[:errors] = ["Couldn't find user with that email"]
      render :new
    end
  end

  def edit
    authorized? ? render "edit" : redirect_to new_session_url
  end
end