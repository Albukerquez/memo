class ProfilesPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    user.present?
  end

  def edit?
    return true if user.present? && user.id == profile.user_id
    false
  end

  def show?
    return true if user.present? && user.id == profile.user_id
    scope.where(id: record.id).exists?
  end

  def update?
    return true if user.present?
    user.present? && user == profile.user
  end

  def destroy?
    return true if user.present?
    user.present? && user == profile.user
  end

  private

  def profile
    record
  end
end
