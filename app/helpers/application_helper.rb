module ApplicationHelper
  def posts_per_page
    3
  end

  def author_posts_more_than?(user, limit_ = 2)
    user.posts.count > limit_
  end
end
