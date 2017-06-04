class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  include Pundit
  after_action :verify_authorized, except: :index, unless: :devise_controller?
  # after_action :verify_policy_scoped, only: :index

  private

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:user_name])
  # end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit({ roles: ['regular'] }, :user_name, :email, :password, :password_confirmation)
    end
  end

  rescue_from Pundit::NotAuthorizedError do
    redirect_to root_url || request.referer, alert: 'У вас нет доступа к этой странице'
  end

  # devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])
  # devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit({ roles: [] }, :email, :password, :password_confirmation, :user_name) }
end
