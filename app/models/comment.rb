class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
end
