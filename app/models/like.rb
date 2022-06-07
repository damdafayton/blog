class Like < ApplicationRecord
  belongs_to :post, dependent: :destroy
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  after_save :update_likes_counter_of_post
  after_destroy -> { update_likes_counter_of_post('down') }

  private

  def update_likes_counter_of_post(arg = 'up')
    case arg
    when 'up'
      post.increment!(:likes_counter)
    when 'down'
      post.decrement!(:likes_counter)
    end
  end
end
