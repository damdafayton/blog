class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'

  def update_post_counter_of_user(bool_)
    # if argument is true increase by 1, if it's false decrease by 1
    user = User.find(author_id)
    user.update(posts_counter: user.posts_counter + (bool_ ? 1 : -1))
  end

  def most_recent_comments(limit_ = 5)
    Comment.joins(:user).select('comments.*, users.name')
      .where(post_id: id).limit(limit_).reverse
  end

  def set_author_id(user_id)
    self.author_id = user_id
    p self
  end

end
