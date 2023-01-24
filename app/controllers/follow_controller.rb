class FollowController < ApplicationController
  def create
    user = current_user
    user.following.create(follower_id: params[:user_id])
    redirect_to request.referer
  end
end
