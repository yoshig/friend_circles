class UsersController < ApplicationController

  def new
    @user = User.new
    @post = Post.new
    3.times { @post.links.build }
  end

  def create
    @user = User.new(user_params)
    if @user.save
      unless params[:post].values.all?(&:blank?)
        @post = @user.posts.new(post_params)
        @post.links.new(link_params)
        flash.now[:errors] = @post.errors.full_messages unless @post.save
      end
      session[:token] = @user.reset_token!
      redirect_to "/"
    else
      flash.now[:errors] = @user.errors.full_messages
      render "new"
    end
  end

  def feed
    @posts = current_user.shared_posts
                         .select("DISTINCT posts.*")
                         .page(params[:page])
                         .per(1)
  end

  def index
  end

  def show
    @user = User.find(params[:id])
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

  def post_params
    params.require(:post).permit(:body)
  end

  def link_params
    params.permit(link: :url)
          .require(:link)
          .values
          .reject { |link_data| link_data[:url].blank? }
  end
end
