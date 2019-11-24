class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show
    @allergens = current_user.restrictions.map do |restriction|
      restriction.name
    end
  end
  
  def edit
  end

  def update
    exists = @user.restrictions.map do |restriction|
      restriction.id
    end
    arr = params[:user][:restriction_ids]
    arr.delete("")
    arr.each do |string_id|
      id = string_id.to_i
      if exists.include?(id)
        UserRestriction.where(user_id: current_user.id, restriction_id: id).delete_all
      else
        restrictions = UserRestriction.new()
        restrictions.user = @user
        restrictions.restriction = Restriction.find(id)
        restrictions.save
      end
    end
    redirect_to user_path(@user)
  end

  private

  def set_user
    @user = User.find(params[:id])
    authorize @user
  end
end
