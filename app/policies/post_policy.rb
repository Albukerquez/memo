class PostPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    user.present? && user.guest?
  end

  def new?
    user.present? && user.guest?
    create?
  end

  def show?
    scope.where(id: record.id).exists?
  end

  def update?
    return true if user.present? && user.admin?

    user.present? && user == record.user
  end

  def destroy?
    user.present? && user.admin?
  end

  private

  def post
    record
  end
end
