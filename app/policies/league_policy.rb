# frozen_string_literal: true

##
# Policies for League controller
#
class LeaguePolicy < ApplicationPolicy
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
    user_present?
  end

  def update?
    user_admin? || user_owner?
  end

  def destroy?
    user_admin? || user_owner?
  end

  private

  ##
  # The user must be present and they must be the owner of league.
  #
  def user_owner?
    user_present? && Tripple.find_by(user_id: user.id, league_id: record.id, role: :owner).present?
  end
end
