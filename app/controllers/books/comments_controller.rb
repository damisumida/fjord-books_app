# frozen_string_literal: true

class Books::CommentsController < CommentsController
  before_action :set_content

  private

  def set_content
    @content = Book.find(params[:book_id])
  end
end
