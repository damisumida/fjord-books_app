class CommentsController < ApplicationController
  before_action :set_comment, only: %i[destroy]

  def create
    user = User.find(current_user.id)
    comment = Comment.new(comment_params)

    comment.user = user
    comment.content = @content
    comment.save
    redirect_to @content, notice: t('controllers.common.notice_create', name: Comment.model_name.human)
  end

  def update
    # comment = Comment.find(comment_id)
    # comment.update(comment_params)
  end

  def destroy
    @comment.destroy
    redirect_to @content, notice: t('controllers.common.notice_destroy', name: Comment.model_name.human)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
