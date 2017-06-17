class CommentPolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def destroy?
    return true if user.present? && user.id == comment.user_id
    false
  end

  private

  def comment
    record
  end
end
