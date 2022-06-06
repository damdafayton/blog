class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, dependent: :destroy, class_name: 'Like', foreign_key: 'author_id'

  def most_recent_comments(limit_ = 3)
    Comment.where(author_id: id).reverse.slice(0, limit_)
  end
end
