class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_action :verify_authenticity_token
  prepend_before_action :verify_user, only: %i(create)

  private

  def sign_up_params
    params.require(:user).permit(:email, :user_name,
                                 :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:email, :user_name, :password,
                                 :password_confirmation, :current_password)
  end
end
