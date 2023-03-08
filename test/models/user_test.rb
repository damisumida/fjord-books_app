# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test '#name_or_email' do
    user = User.new(email: 'foo@example.com', name: '')
    assert_equal 'foo@example.com', user.name_or_email

    user.name = 'Foo.Bar'
    assert_equal 'Foo.Bar', user.name_or_email
  end

  test '#follow_to_#following?' do
    alice = users(:alice)
    bob = users(:bob)

    assert_not alice.following?(bob)
    alice.follow(bob)
    assert alice.following?(bob)
  end

  test '#followed_by?' do
    alice = users(:alice)
    bob = users(:bob)

    assert_not alice.followed_by?(bob)
    bob.follow(alice)
    assert alice.followed_by?(bob)
  end

  test 'follow/unfollow/following?/followed_by?' do
    alice = users(:alice)
    bob = users(:bob)

    assert_not alice.following?(bob)
    assert_not bob.followed_by?(alice)
    alice.follow(bob)
    assert alice.following?(bob)
    assert bob.followed_by?(alice)
    alice.unfollow(bob)
    assert_not alice.following?(bob)
    assert_not bob.followed_by?(alice)
  end
end
