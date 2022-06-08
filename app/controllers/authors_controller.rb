class AuthorsController < ApplicationController
  def index
    @authors = User.all
  end

  def show
    @user = begin
      User.find(params[:id])
    rescue StandardError
      nil
    end

    @user_posts = @user.most_recent_posts(2)
  end
end
