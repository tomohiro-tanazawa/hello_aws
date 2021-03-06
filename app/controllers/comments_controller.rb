class CommentsController < ApplicationController
  def create
    @tweet = Tweet.find_by(id: params[:tweet_id])
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    comment.tweet_id = params[:tweet_id]
    comment.save
    redirect_to tweet_path(@tweet.id)
  end

  def destroy
  end
  
  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
