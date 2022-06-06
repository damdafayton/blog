class Like < ApplicationRecord
  belongs_to :post, dependent: :destroy
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  def update_like_counter_of_post(bool_)
    # if argument is true increase by 1, if it's false decrease by 1
    post = Post.find(post_id)
    post.update(likes_counter: post.likes_counter + (bool_ ? 1 : -1))
  end
end
