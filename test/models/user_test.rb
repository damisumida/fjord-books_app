# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test '#name_or_email' do
    user = User.new(email: 'foo@example.com', name: '')
    assert_equal 'foo@example.com', user.name_or_email

    user.name = 'Foo.Bar'
    assert_equal 'Foo.Bar', user.name_or_email
  end

  test '#follow_to_unfollow' do
    me = User.create!(email: 'me@example.com', password: 'passsword')
    she = User.create!(email: 'she@example.com', password: 'passsword')

    assert_not me.following?(she)
    me.follow(she)
    assert me.following?(she)
    me.unfollow(she)
    assert_not me.following?(she)
  end
end
