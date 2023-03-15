# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
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
