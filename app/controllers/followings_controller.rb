 # frozen_string_literal: true

class FollowingsController < ApplicationController
  def create
    user = User.find(params[:user_id])
    follow = Follow.new(following_id: current_user.id, follower: user)
    if follow.save
      redirect_to user, notice: t('controllers.common.notice_create', name: Follow.model_name.human)
    else
      redirect_to user, notice: t('errors.template.header.one', model: Follow.model_name.human)
    end
  end

  def destroy
    follow = Follow.find_by(follower_id: params[:user_id], following_id: current_user.id)
    follow.destroy
    redirect_to User.find(params[:user_id]), action: :show, notice: t('controllers.common.notice_destroy', name: Follow.model_name.human)
  end

  def index
    user = User.find(params[:user_id])
    @users = user.followings.with_attached_avatar.order(:id)
  end
end
