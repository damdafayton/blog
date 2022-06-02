class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes, dependent: :destroy, class_name: 'Like', foreign_key: 'author_id'
end
