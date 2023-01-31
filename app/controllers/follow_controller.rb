class FollowController < ApplicationController
  def create
    user = current_user
    user.following.create(follower_id: params[:user_id])
    redirect_to request.referer
  end

  def destroy
    follow = Follow.find_by(follower_id: params[:user_id], following_id: current_user.id)
    follow.delete
    redirect_to request.referer
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
