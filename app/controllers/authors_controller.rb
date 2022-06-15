class AuthorsController < ApplicationController
  # p author_signed_in?
  # p user_session\

  def index
    @authors = User.all.reverse
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
