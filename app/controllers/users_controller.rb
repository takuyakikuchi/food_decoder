class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show; end

  def edit
  end

  def update
    exists = @user.restrictions.map do |restriction|
      restriction.id
    end
    restrictions = UserRestriction.new()
    arr = params[:user][:restriction_ids]
    raise
    arr.delete("")
    arr.each do |id|
      if exists.include?(id)
        deleting = @user.restrictions.find(id)
        deleting.delete
      else
        restrictions.user = @user
        found = Restriction.find(id)
        restrictions.restriction = found
        restrictions.save
      end
    end
    redirect_to user_path(@user)
  end

  private

  # def user_params
  #   params.require(:user).permit(restriction_ids: [])
  # end

  def set_user
    @user = User.find(params[:id])
    authorize @user
  end
end
