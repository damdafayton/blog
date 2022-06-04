class ApplicationController < ActionController::Base
  def current_user
    User.find(2)
  end

  def user_posts_count(user_id)
    Post.where(author_id: user_id).length
  end
end
