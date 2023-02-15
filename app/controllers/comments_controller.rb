class CommentsController < ApplicationController
  def create
    user = User.find(current_user.id)
    comment = Comment.new(comment_params)

    comment.user = user
    comment.content = @content
    comment.save
    redirect_to @content, notice: t('.notice')
  end

  def update
    # comment = Comment.find(comment_id)
    # comment.update(comment_params)
  end

  def destroy
    # comment = Comment.find(comment_id)
    # comment.destroy!
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
