class User < ApplicationRecord
  has_many :posts, :comments
  has_many :likes, dependent: :destroy
  def start
    p 'empty_model'
  end
end
