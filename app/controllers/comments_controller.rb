class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:notice] = "Successully Commented!"
    else
      flash[:error] = "Couldn't save the comment."
    end
    redirect_to movie_path(comment_params[:movie_id])
  end
  def destroy
    @comment = Comment.find(params[:id])
    if @comment.user == current_user
      if @comment.delete
        flash[:notice] = "Successfully removed comment."
      else
        flash[:error] = "Couldn't delete the comment."
      end
    else
      flash[:error] = "Something went wrong! :/ This isn't your comment"
    end
    redirect_back(fallback_location: :root)
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :movie_id, :content)
  end
end