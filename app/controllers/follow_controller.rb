# frozen_string_literal: true

class FollowController < ApplicationController
  def create
    user = User.find(params[:user_id])
    follow = Follow.new(following_id: current_user.id, follower: user)
    if follow.save
      redirect_to request.referer, notice: t('controllers.common.notice_create', name: Follow.model_name.human)
    else
      redirect_to request.referer, notice: t('errors.template.header.one', model: Follow.model_name.human)
    end
  end

  def destroy
    follow = Follow.find_by(follower_id: params[:user_id], following_id: current_user.id)
    follow.destroy
    redirect_to request.referer, notice: t('controllers.common.notice_destroy', name: Follow.model_name.human)
  end

  def follower_index
    user = User.find(params[:user_id])
    @users = user.followers
  end

  def index
    user = User.find(params[:user_id])
    @users = user.followings
  end
end
