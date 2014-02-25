class FriendCirclesController < ApplicationController
  def create
    @friend_circle = FriendCircle.new(fc_params)
    @friend_circle.user_ids = params[:friend_circle][:user_ids]
    @friend_circle.user_id = current_user.id

    if @friend_circle.save
      redirect_to user_friend_circle_url(current_user, @friend_circle)
    else
      flash.now[:errors] = @friend_circle.errors.full_messages
      render :new
    end
  end

  def edit
    if authorized?
      @friend_circle = FriendCircle.find(params[:id])
      render :edit
    else
      redirect_to new_session_url
    end
  end

  def new
    @friend_circle = FriendCircle.new
  end

  def show
    @friend_circle = FriendCircle.find(params[:id])
  end

  def update
    @friend_circle = FriendCircle.find(params[:id])
    @friend_circle.user_ids = params[:friend_circle][:user_ids]

    if @friend_circle.update(fc_params)
      redirect_to friend_circle_url(@friend_circle)
    else
      flash.now[:errors] = @friend_circle.errors.full_messages
      render :edit
    end
  end

  private

  def fc_params
    params.require(:friend_circle).permit(:name)
  end
end
