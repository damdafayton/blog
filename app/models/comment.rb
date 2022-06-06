class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  def update_comments_counter_of_post(bool_)
    # if argument is true increase by 1, if it's false decrease by 1
    post = Post.find(post_id)
    post.update(comments_counter: post.comments_counter + (bool_ ? 1 : -1))
  end
end
