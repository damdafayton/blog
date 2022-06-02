class Like < ApplicationRecord
  belongs_to :post, dependent: :destroy
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'

  def update_like_counter_of_post(bool)
    post = Post.find(self.post_id)
    post.update(likes_counter: post.likes_counter + (bool ? 1 : -1))
  end
end
