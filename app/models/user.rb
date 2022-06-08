class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, dependent: :destroy, class_name: 'Like', foreign_key: 'author_id'
  validates :name, presence: true
  validates :bio, presence: true

  def most_recent_posts(limit_ = 3)
    # Posts.where(author_id: id).reverse.slice(0, limit_)
    posts.order(created_at: :desc).limit(limit_)
  end
end
