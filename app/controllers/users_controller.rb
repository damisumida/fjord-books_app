class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[show]

  def show; end

  def index
    @users = User.order(:id).page(params[:page])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:format])
  end
end
