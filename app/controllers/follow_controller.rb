class FollowController < ApplicationController
  def create
    user = current_user
    user.following.create(follower_id: params[:user_id])
    redirect_to request.referer
  end

  def destroy
    follow = Follow.find_by(follower_id: params[:user_id], following_id: current_user.id)
    follow.destroy
    redirect_to request.referer
  end
end
