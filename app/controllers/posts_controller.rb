class PostsController < ApplicationController
  def index
    # make url_helper for pagination
    page = params[:page].to_i
    show_until_this_post = [page, 1].max * 2
    @user = User.find(params[:user_id])
    @posts = Post.all.slice(show_until_this_post - 2, show_until_this_post)
    # reduce post text
    @posts.each do |post|
      post.text = "#{post.text.slice(0, 200)}.." if post.text.length > 200
    end

    @page_amount = user_posts_count(@user) / 2.to_f
    @page_amount = @page_amount.ceil
  end

  def show
    @post = Post.joins(:user).select('posts.*, users.name').find(params[:id])
  end

  def new; end
end
