class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.article_id = params[:article_id]
    @comment.user = current_user
    @comment.save
    redirect_to article_path(@comment.article)
  end

  # Why did this go into the controller but the articles one went in the helper.
  def comment_params
    params.require(:comment).permit(:body)
  end
end
