class AuthorsController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = begin
      User.find(params[:id])
    rescue StandardError
      nil
    end

    @user_posts = Post.where(author_id: params[:id]).limit(2)
  end
end
