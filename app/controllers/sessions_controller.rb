class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(params[:user][:email], params[:user][:password])

    if @user
      session[:token] = @user.reset_token!
      redirect_to '/'
    else
      flash.now[:errors] = ["Invalid combo"]
      render :new
    end
  end

  def destroy
    @user = current_user
    @user.reset_token!
    session[:token] = nil
    redirect_to '/'
  end
end
