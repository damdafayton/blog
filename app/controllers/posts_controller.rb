class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.all.limit(2)
    @user_posts_count = user_posts_count(@user)
  end
  
  def show
    @post = Post.find(params[:id]).most_recent_comments(5)
  end
end
