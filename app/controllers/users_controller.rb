class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit]

  def show
  end

  def edit
  end

  def update
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params

  end
end
