class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show; end

  def edit; end

  def update
    # @user.restrictions =
    # redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(restriction_ids: [])
  end

  def set_user
    @user = User.find(params[:id])
    authorize @user
  end
end
