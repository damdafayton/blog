class AuthorsController < ApplicationController
  # p author_signed_in?
  # p user_session\

  def index
    @authors = User.all.reverse
  end

  def show
    @user = User.find(params[:id])
    @user_posts = @user&.most_recent_posts(2)
  rescue StandardError
    nil
  end
end
