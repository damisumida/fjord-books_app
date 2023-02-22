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
    me = User.create!(email: 'me@example.com', password: 'passsword')
    she = User.create!(email: 'she@example.com', password: 'passsword')

    assert_not me.following?(she)
    me.active_relationships.find_or_create_by!(following_id: she.id)
    assert me.following?(she)
  end

  test '#followed_by?' do
    me = User.create!(email: 'me@example.com', password: 'passsword')
    she = User.create!(email: 'she@example.com', password: 'passsword')

    assert_not me.following?(she)
    me.active_relationships.find_or_create_by!(following_id: she.id)
    assert me.following?(she)
  end

  test '#follow' do
    me = User.create!(email: 'me@example.com', password: 'passsword')
    she = User.create!(email: 'she@example.com', password: 'passsword')

    assert_not me.active_relationships.where(following_id: she.id).exists?
    me.follow(she)
    assert me.active_relationships.where(following_id: she.id).exists?
  end

  test '#unfollow' do
    me = User.create!(email: 'me@example.com', password: 'passsword')
    she = User.create!(email: 'she@example.com', password: 'passsword')

    me.active_relationships.find_or_create_by!(following_id: she.id)
    me.unfollow(she)
    assert_not me.active_relationships.where(following_id: she.id).exists?
  end
end
