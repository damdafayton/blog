class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.all.limit(2)
    @posts.each {|post| if post.text.length > 200 then post.text = post.text.slice(0,200)+'..' end}
    @user_posts_count = user_posts_count(@user)
  end
  
  def show
    @post = Post.joins(:user).select('posts.*, users.name').find(params[:id])
  end
end
