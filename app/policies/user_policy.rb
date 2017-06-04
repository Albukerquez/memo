class UserPolicy < ApplicationPolicy
  def create?
    registration_roles.include?(target_user.role_id) if current_user.nil?
  end

  private

  def registration_roles
    %w(regular)
  end
end
