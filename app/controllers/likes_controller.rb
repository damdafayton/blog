class LikesController < ApplicationController
  protect_from_forgery except: :like

  def index
    new_like = Like.new(author_id: current_user.id, post_id: params[:id])
    if new_like.save
      # success message
      flash[:success] = 'New like'
      # redirect to index
      post_likes_count = Post.find(params[:id]).likes_counter
      p post_likes_count
      render json: { post_likes_count: }, status: 200
    else
      # error message
      flash.now[:error] = 'An error occured'
      # render new
      render body: nil, status: 400
    end
  end
end
