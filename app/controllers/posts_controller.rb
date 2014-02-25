class PostsController < ApplicationController

  def new
    @post = Post.new
    3.times { @post.links.build }
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.links.new(link_params)
    @post.friend_circle_ids = params[:post][:friend_circle_ids]
    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def upvote
    existing_vote = Upvote.where(post_id: params[:post_id],
                                 user_id: current_user.id)
    if existing_vote.empty?
      upvote = Upvote.new
      upvote.user_id = current_user.id
      upvote.post_id = params[:post_id]
      upvote.save
    else
      existing_vote.first.destroy
    end
    redirect_to post_url(params[:post_id])
  end

  private

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
