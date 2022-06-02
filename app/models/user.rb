class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes, dependent: :destroy, class_name: 'Like', foreign_key: 'author_id'

  def most_recent_comments(_limit = 3)
    Comment.where(author_id: self.id).reverse.slice(0, _limit)
  end
  
end
