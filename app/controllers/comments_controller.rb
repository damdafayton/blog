class CommentsController < ApplicationController
  def create
    new_comment = Comment.new(new_comment_params)
    new_comment.author_id = current_user.id
    p new_comment
    p params
    # respond_to block
    respond_to do |new|
      new.html do
        if new_comment.save
          # success message
          flash[:success] = 'Comment saved successfully'
        else
          # error message
          flash.now[:error] = 'Error: Comment could not be saved'
        end
        redirect_to author_post_path(params[:author_id], params[:post_id])
      end
    end
  end

  private

  def new_comment_params
    params.require(:comment).permit(:text, :post_id)
  end
end
