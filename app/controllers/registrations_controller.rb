class RegistrationsController < Devise::RegistrationsController
    protected
    def after_sign_in_path_for(resource)
      @user = current_user
      edit_user_path(@user)
    end
end