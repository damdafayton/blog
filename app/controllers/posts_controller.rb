class PostsController < ApplicationController
  def index
    p params
    page = params[:page].to_i
    page = [page, 1].max
    @user = User.find(params[:author_id])
    @posts = Post.all.slice((page * 2) - 2, page * 2)
    @posts.each { |post| post.text = "#{post.text.slice(0, 200)}.." if post.text.length > 200 }
    @user_posts_count = user_posts_count(@user)
  end

  def show
    @post = Post.joins(:author).select('posts.*, users.name').find(params[:id])
  end
end
