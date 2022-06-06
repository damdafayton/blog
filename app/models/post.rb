class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  after_save :update_post_counter_of_user
  after_destroy -> { update_post_counter_of_user('down') }

  def most_recent_comments(limit_ = 5)
    comments.order(created_at: :desc).limit(limit_)
  end

  private

  def update_post_counter_of_user(arg = 'up')
    case arg
    when 'up'
      author.increment!(:posts_counter)
    when 'down'
      author.decrement!(:posts_counter)
    end
  end
end
