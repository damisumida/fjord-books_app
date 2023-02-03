# frozen_string_literal: true

class FollowController < ApplicationController
  def create
    user = User.find(params[:user_id])
    follow = Follow.new(following_id: current_user.id, follower: user)

    respond_to do |format|
      if follow.save
        format.html { redirect_to request.referer, notice: t('controllers.common.notice_create', name: Follow.model_name.human) }
        format.json { render :show, status: :created, location: user }
      else
        format.html { redirect_to request.referer, notice: t('errors.template.header.one', model: Follow.model_name.human) }
        format.json { render json: user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    follow = Follow.find_by(follower_id: params[:user_id], following_id: current_user.id)
    follow.destroy
    respond_to do |format|
      format.html { redirect_to request.referer, notice: t('controllers.common.notice_destroy', name: Follow.model_name.human) }
      format.json { head :no_content }
    end
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
