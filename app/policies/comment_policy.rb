class CommentPolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def destroy?
    return true if user.present?
    user.present? && user == record.user
  end

  private

  def comment
    record
  end
end
