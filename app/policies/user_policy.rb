class UserPolicy < ApplicationPolicy
  
  def index?
    user_present?
  end

  def show?
    user_present?
  end

  def create?
    true
  end

  def update?
    user_admin? || (user_self? && !record.role_changed?)
  end

  def destroy?
    user_admin?
  end
  
  private 

  def user_self?
    user_present? && user.id == record.id
  end  
end
