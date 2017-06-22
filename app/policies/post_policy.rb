class PostPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    user.present?
  end

  def edit?
    return true if user.present? && user.id == post.user_id
    false
  end

  def show?
    return true if user.present?
  end

  def update?
    return true if user.present?
    user.present? && user == post.user
  end

  def destroy?
    return true if user.present?
    user.present? && user == post.user
  end

  private

  def post
    record
  end
end
