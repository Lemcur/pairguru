class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:alert] = "Saved"
    else
      flash[:error] = "asd"
    end
    redirect_to movie_path(comment_params[:movie_id])
  end
  def destroy
    @comment = Comment.find(params[:id])
    if @comment.delete
      flash[:alert] = "Saved"
    else
      flash[:error] = "asd"
    end
    redirect_back(fallback_location: :root)
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :movie_id, :content)
  end
end