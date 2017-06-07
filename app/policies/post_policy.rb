class PostPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    user.present?
  end

  def show?
    scope.where(id: record.id).exists?
  end

  def update?
    return true if user.present?
    user.present? && user == record.user
  end

  def destroy?
    return true if user.present?
    user.present? && user == record.user
  end

  private

  def post
    record
  end
end
