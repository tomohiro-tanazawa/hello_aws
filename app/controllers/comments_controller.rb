class CommentsController < ApplicationController
  def create
    @tweet = Tweet.find(params[:id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.tweet_id = @tweet.id
    comments.save
    redirect_to tweet_path(@tweet.id)
  end

  def destroy
  end
  
  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
