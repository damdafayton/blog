module ApplicationHelper
  def posts_per_page
    3
  end

  def user_posts_more_than?(user, limit_ = 2)
    @user_posts = Post.where(author_id: user)
    @user_posts.length > limit_
  end
end
