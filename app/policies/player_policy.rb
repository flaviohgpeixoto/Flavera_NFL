class PlayerPolicy < ApplicationPolicy
  
  def index?
    user_present?
  end

  def show?
    user_present?
  end

  def create?
    user_admin?
  end

  def update?
    user_admin?
  end

  def destroy?
    user_admin?
  end
  
end
