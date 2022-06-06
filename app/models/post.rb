class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  after_save :update_post_counter_of_user
  after_destroy :update_post_counter_of_user('down')

  def most_recent_comments(limit_ = 5)
    self.comments.reverse.slice(0, limit_)
  end

  private

  def update_post_counter_of_user(arg='up')
    if arg=='up'
      self.author.increment!(:posts_counter)
    elsif arg=='down'
      self.author.decrement!(:posts_counter)
    end
  end

end
