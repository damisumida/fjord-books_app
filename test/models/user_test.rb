# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test '#name_or_email' do
    user = User.new(email: 'foo@example.com', name: '')
    assert_equal 'foo@example.com', user.name_or_email

    user.name = 'Foo.Bar'
    assert_equal 'Foo.Bar', user.name_or_email
  end

  test '#following?' do
    alice = users(:alice)
    bob = users(:bob)

    assert_not alice.following?(bob)
    alice.active_relationships.find_or_create_by!(following_id: bob.id)
    assert alice.following?(bob)
  end

  test '#followed_by?' do
    alice = users(:alice)
    bob = users(:bob)

    assert_not alice.following?(bob)
    alice.active_relationships.find_or_create_by!(following_id: bob.id)
    assert alice.following?(bob)
  end

  test '#follow' do
    alice = users(:alice)
    bob = users(:bob)

    assert_not alice.active_relationships.where(following_id: bob.id).exists?
    alice.follow(bob)
    assert alice.active_relationships.where(following_id: bob.id).exists?
  end

  test '#unfollow' do
    alice = users(:alice)
    bob = users(:bob)

    alice.active_relationships.find_or_create_by!(following_id: bob.id)
    alice.unfollow(bob)
    assert_not alice.active_relationships.where(following_id: bob.id).exists?
  end
end
