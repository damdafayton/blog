class LikesController < ApplicationController
  # skip_before_action :verify_authenticity_token
  # protect_from_forgery except: :like # works without devise

  def index
    respond_to do |format|
      format.js do
        p 'RESPONDING'
        if current_user
          new_like = Like.new(author_id: current_user.id, post_id: params[:id])
          if new_like.save
            # success message
            # flash[:success] = 'New like'
            # redirect to index
            post_likes_count = Post.find(params[:id]).likes_counter
            render json: { success: post_likes_count }, status: 200
          else
            # error message
            # flash.now[:error] = 'An error occured'
            # this is fetch request
            # render new
            # render user_session_path
            render json: { error: 'An error occured' }, status: 401
          end
        else 
          p 'USER NOT LOGGED IN'
          # flash.now[:error] = "Log In to give likes"
          # this is fetch request
          # redirect_to user_session_path
          render json: { error: "Log In to give likes" }, status: 401
        end
      end
    end
  end
end
