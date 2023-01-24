# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  # フォローをした、されたの関係
  # フォロワーIDとユーザIDの関係
  has_many :follower, class_name: "Follow", foreign_key: "follower_id", dependent: :destroy
  # フォローIDとユーザIDの関係
  has_many :following, class_name: "Follow", foreign_key: "following_id", dependent: :destroy
  # foreign_keyはvaridateに変えても変わらない？

  # 一覧画面で使う
  # フォロー一覧
  has_many :followings, through: :follower_relationships, source: :follower
  # フォロワー一覧
  has_many :followers, through: :following_relationships, source: :following
end
