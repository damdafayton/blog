class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'

  def update_comments_counter_of_post
    # if argument is true increase by 1, if it's false decrease by 1
    post = Post.find(self.post_id)
    post.update(comments_counter: post.comments_counter + 1)
  end
end
