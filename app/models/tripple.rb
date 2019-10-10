# frozen_string_literal: true

##
# Relation between users, leagues and teams.
#
class Tripple < ApplicationRecord
  #
  # Associations
  #

  belongs_to :league
  belongs_to :team, optional: true
  belongs_to :user

  #
  # Enumerators
  #

  enum role: %i[std owner]

  #
  # Validations
  #

  validate :team_needed?

  ##
  # If the user is not the owner of the league, it should have a team
  #

  def team_needed?
    errors.add(:base, 'User must select a team.') if std?
  end
end
