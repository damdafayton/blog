class AuthorsController < ApplicationController
  # p author_signed_in?
  # p user_session\

  def index
    @authors = User.all
  end

  def show
    @user = begin
      User.find(params[:id])
    rescue StandardError
      nil
      p 'no user'
    end

    @user_posts = @user.most_recent_posts(2)
  end
end
