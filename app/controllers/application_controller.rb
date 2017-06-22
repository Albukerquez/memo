class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  include Pundit
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action :verify_authorized, unless: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:user_name, :email, :password, :password_confirmation)
    end
  end

  rescue_from Pundit::NotAuthorizedError do
    redirect_to root_path || request.referer, alert: 'У вас нет прав для просмотра данной страницы'
  end
end
