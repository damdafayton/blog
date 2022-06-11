class PostsController < ApplicationController
  # load_and_authorize_resource

  def index
    # make url_helper for pagination
    page = [params[:page].to_i, 1].max
    posts_per_page = 2
    start_from_this_post = (page - 1) * posts_per_page
    @user = User.find(params[:author_id])
    @posts = @user.most_recent_posts(start_from_this_post + posts_per_page)
      .slice(start_from_this_post, posts_per_page)
    p @posts
    # reduce post text
    @posts.each do |post|
      post.text = "#{post.text.slice(0, 200)}.." if post.text.length > 200
    end

    @page_amount = user_posts_count(@user) / 2.to_f
    @page_amount = @page_amount.ceil
  end

  def show
    p 'user = ', current_user
    # @post = Post.joins(:author).select('posts.*, users.name').find(params[:id])
    @post = Post.includes(:author).find(params[:id])
  end

  def new
    @current_user = current_user
    @post = Post.new
  end

  def create
    new_post = Post.new(new_post_params)
    new_post.author_id = current_user.id

    # respond_to block
    respond_to do |new|
      new.html do
        if new_post.save
          # success message
          flash[:success] = 'Post saved successfully'
          # redirect to index
          redirect_to author_posts_url(current_user.id)
        else
          # error message
          flash.now[:error] = 'Error: Post could not be saved'
          # render new
          render :new
        end
      end
    end
  end

  private

  def new_post_params
    params.require(:post).permit(:title, :text, :author_id)
  end
end
