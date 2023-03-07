# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    @report = reports(:alice_report)

    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_on 'ログイン'
  end

  test 'visiting the index' do
    visit reports_path
    assert_selector 'h1', text: '日報'

    assert_text 'Railsでテストを書く'
    within(:xpath, '//table/tbody/tr[1]/td[2]') do
      assert_text 'alice'
    end
  end

  test 'creating a report' do
    visit reports_url
    click_on '新規作成'

    fill_in 'タイトル', with: '今日の日報'
    fill_in '内容', with: '課題を提出した!'

    click_on '登録する'

    assert_text '日報が作成されました。'
    assert_text '今日の日報'
    assert_text '課題を提出した!'
  end

  test 'updating a Report' do
    visit reports_url
    click_link '詳細', match: :first

    assert_text 'Railsでテストを書く'
    assert_text 'たのしかった！'

    click_on '編集'
    fill_in '内容', with: '頑張った'
    fill_in 'タイトル', with: 'Railsの基本'

    click_on '更新する'
    assert_text '日報が更新されました。'
    assert_text 'Railsの基本'
    assert_text '頑張った'
  end

  test 'destroying a Book' do
    visit reports_url

    assert_text 'Railsでテストを書く'

    page.accept_confirm do
      click_link '削除', match: :first
    end

    assert_text '日報が削除されました。'
    assert_no_text 'Railsでテストを書く'
  end
end
