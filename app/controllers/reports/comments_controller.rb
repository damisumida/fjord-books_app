# frozen_string_literal: true

class Reports::CommentsController < CommentsController
  before_action :set_content

  private

  def set_content
    @content = Report.find(params[:report_id])
  end
end
