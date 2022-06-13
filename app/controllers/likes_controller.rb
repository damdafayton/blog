class LikesController < ApplicationController
  # skip_before_action :verify_authenticity_token
  load_and_authorize_resource
  # protect_from_forgery except: :index # works without devise

  def index
    respond_to do |format|
      format.html do
        if current_user
          new_like = Like.new(author_id: current_user.id, post_id: params[:id])
          if Like.exists?(author_id: current_user.id, post_id: params[:id])
            likes = Like.all.where(author_id: current_user.id, post_id: params[:id])
            likes.each(&:destroy)
            # post_likes_count = Post.find(params[:id]).likes_counter
          elsif new_like.save
            # post_likes_count = Post.find(params[:id]).likes_counter
            # p post_likes_count
          else
            # error message
            flash.now[:error] = 'An error occured'
          end
          redirect_back fallback_location: root_path
        else
          flash.now[:error] = 'Log In to give likes'
          # this is fetch request
          redirect_to user_session_path
        end
      end
    end
  end
end
