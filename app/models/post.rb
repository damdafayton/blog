class Post < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'

  def update_post_counter_of_user(bool)
    # if argument is true increase by 1, if it's false decrease by 1
    user = User.find(self.author_id)
    user.update(posts_counter: user.posts_counter + (bool ? 1 : -1))
  end

  def most_recent_comments(_limit = 5)
    Comment.where(post_id: self.id).reverse.slice(0, _limit)
  end
end
