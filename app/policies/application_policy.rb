# frozen_string_literal: true

##
# Master Policy - Original from Gem Pundit.
#
class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  ##
  # Master Policy - Original from Gem Pundit.
  #
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end

  private

  ##
  # The current user must be present and the user must have an assigned ID.
  #
  def user_present?
    user.present? && user.id.present?
  end

  ##
  # The user must be present and they must be an administrator.
  #
  def user_admin?
    user.present? && user.admin?
  end
end
