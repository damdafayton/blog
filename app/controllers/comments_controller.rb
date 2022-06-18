class CommentsController < ApplicationController
  load_and_authorize_resource
  # skip_before_action :verify_authenticity_token

  SUCCESS_MSG = 'Comment saved successfully'.freeze
  ERROR_MSG = 'Error: Comment could not be saved'.freeze
  ERROR_NOT_FOUND = 'Comment not found'.freeze
  ERROR_PARAMS = 'Paramater is missing or wrong'.freeze

  def create
    new_comment = Comment.new(create_params)
    new_comment.author_id = current_user.id

    respond_to do |new|
      if new_comment.save
        new.html do
          # success message
          flash[:success] = SUCCESS_MSG
          redirect_to author_post_path(params[:author_id], params[:post_id])
        end
        new.xml { render xml: SUCCESS_MSG }
        new.json { render json: SUCCESS_MSG, status: 201 }
      else
        new.html do
          # error message
          flash.now[:error] = ERROR_MSG
          redirect_back
          redirect_to author_post_path(params[:author_id], params[:post_id])
        end
        new.xml { render xml: ERROR_MSG }
        new.json { render json: ERROR_MSG, status: 422 }
      end
    end
  end

  rescue_from ActionController::ParameterMissing do
    p 'MISSING PARAM'
    respond_to do |format|
      format.json { render json: ERROR_PARAMS, status: 422 }
    end
  end

  def destroy
    if @comment.destroy
      flash[:success] = 'Comment deleted successfully'
    else
      flash[:error] = 'Error: Comment could not be deleted'
    end
    redirect_back(fallback_location: root_path)
  end

  def index
    comments = Post.find(params[:post_id]).comments
    respond_to do |format|
      # format.html # index.html.erb
      format.xml { render xml: comments }
      format.json { render json: comments, status: 200 }
    end
  rescue ActiveRecord::RecordNotFound
    respond_to do |format|
      # format.html # index.html.erb
      format.xml { render xml: ERROR_NOT_FOUND }
      format.json { render json: ERROR_NOT_FOUND, status: 404 }
    end
  end

  private

  # use create_ for cancancan
  def create_params
    params.require(:comment).permit(:text, :post_id)
  end
end
