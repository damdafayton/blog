class AuthorsController < ApplicationController
  # p author_signed_in?
  # p user_session\

  def index
    @authors = User.all
  end

  def show
    @user = begin
      User.find(params[:id])
      @user_posts = @user&.most_recent_posts(2)
    rescue StandardError
      nil
    end
  end
end
