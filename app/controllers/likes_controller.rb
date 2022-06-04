class LikesController < ApplicationController
  protect_from_forgery except: :like

  def index
    p 'hello lolo'
    new_like = Like.new(author_id: current_user.id, post_id: params[:id])
    p new_like
    if new_like.save
      # success message
      flash[:success] = 'New like'
      # redirect to index
      render body: nil, status: 200
    else
      # error message
      flash.now[:error] = 'An error occured'
      # render new
      render body: nil, status: 400
    end
  end
end