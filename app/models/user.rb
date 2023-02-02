# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  has_many :follower, class_name: "Follow", foreign_key: "follower_id", dependent: :destroy
  has_many :following, class_name: "Follow", foreign_key: "following_id", dependent: :destroy

  has_many :followings, through: :following, source: :follower
  has_many :followers, through: :follower, source: :following
end
