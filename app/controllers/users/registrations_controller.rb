class Users::RegistrationsController < Devise::RegistrationsController
  after_action :verify_authorized, unless: :devise_controller?

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
