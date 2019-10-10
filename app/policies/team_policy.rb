# frozen_string_literal: true

##
# Policies for Team controller
#
class TeamPolicy < ApplicationPolicy
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
    user_admin?
  end

  def update?
    user_admin?
  end

  def destroy?
    user_admin?
  end
end
