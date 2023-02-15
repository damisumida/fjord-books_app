class Books::CommentsController < CommentsController
  before_action :set_content, only: %i[create]

  private

  def set_content
    @content = Book.find(params[:book_id])
  end
end
