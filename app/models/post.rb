class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  def update_post_counter_of_user(bool_)
    # if argument is true increase by 1, if it's false decrease by 1
    user = User.find(author_id)
    user.update(posts_counter: user.posts_counter + (bool_ ? 1 : -1))
  end

  def most_recent_comments(limit_ = 5)
    Comment.where(post_id: id).reverse.slice(0, limit_)
  end
end
