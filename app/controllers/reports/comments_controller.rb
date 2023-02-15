class Reports::CommentsController < CommentsController
  before_action :set_content, only: %i[create]

  private

  def set_content
    @content = Report.find(params[:report_id])
  end
end
