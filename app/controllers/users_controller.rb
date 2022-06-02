class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def show
    @user = User.find(params[:id]) rescue nil
    @user_posts = Post.where(author_id: params[:id])
    @user_posts_length = @user_posts.length
    @user_posts = @user_posts.limit(3)
  end
end
