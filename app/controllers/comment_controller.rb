class CommentController < ApplicationController
  before_action :set_user

  def create
    # user = User.find(current_user.id)
    # content = Book.find(book_id)
    # comment = Comment.new(comment_params)

    # comment.user = user
    # comment.content = content
    # comment.save
    # redirect_to user_path(@user), notice: t('.notice')
  end

  def update
    # comment = Comment.find(comment_id)
    # comment.update(comment_params)
  end

  def destroy
    # comment = Comment.find(comment_id)
    # comment.destroy!
  end
end
