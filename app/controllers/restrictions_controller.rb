class RestrictionsController < ApplicationController

  def new
    @restriction = Restriction.new()
    authorize @restriction
  end

  def create
    @user = current_user
    @restriction = Restriction.new(restriction_params)
    authorize @restriction
    if @restriction.save
      user_restriction = UserRestriction.new(user: @user, restriction: @restriction)
      user_restriction.save
      redirect_to user_path(current_user)
    else
      render 'registration/new'
    end
  end

  private

  def restriction_params
    params.require(:restriction).permit(:name, :photo)
  end
end
