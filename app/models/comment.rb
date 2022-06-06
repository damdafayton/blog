class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  after_save :update_comments_counter_of_post
  after_destroy :update_comments_counter_of_post('down')

  private
  
  def update_comments_counter_of_post(arg='up')
    if arg=='up'
      self.post.increment!(:comments_counter)
    elsif arg=='down'
      self.post.decrement!(:comments_counter)
    end
  end

end
