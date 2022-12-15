class UsersController < ApplicationController
  before_action :set_user, only: %i[show]

  def show; end

  def index
    @users = User.order(:id).page(params[:page])
  end

  # def update
  #   respond_to do |format|
  #     if @users.update(user_params)
  #       format.html { redirect_to @user, notice: 'success' }
  #       format.json { render :show, status: :ok, location: @user }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @user.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:format])
  end

  # Only allow a list of trusted parameters through.
  def _params
    params.require(:book).permit(:title, :memo, :author, :picture)
  end
end
