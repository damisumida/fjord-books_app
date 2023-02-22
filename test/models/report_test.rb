# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test '#editable?' do
    report = Report.new(title: 'hoge', content: 'fuga')
    me = User.create!(email: 'me@example.com', password: 'passsword')
    she = User.create!(email: 'she@example.com', password: 'passsword')

    report.user = me
    report.save

    assert report.editable?(me)
    assert_not report.editable?(she)
  end
end
