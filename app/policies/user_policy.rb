# frozen_string_literal: true

##
# Policies for Tripple controller
#
class UserPolicy < ApplicationPolicy
  ##
  # "user_present?" and "user_admin?" defined in ApplicationPolicy.
  #
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

  ##
  # The user just can update info of your own profile.
  #
  def user_self?
    user_present? && user.id == record.id
  end
end
