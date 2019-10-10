# frozen_string_literal: true

##
# Model Tripple
#
class Tripple < ApplicationRecord
  ##
  # Setting relations between models.
  #
  belongs_to :league
  belongs_to :team, optional: true
  belongs_to :user

  ##
  # Enumerating role positions for user who creates a league.
  #
  enum role: %i[std owner]

  ##
  # Verifying if user has a team on a league.
  #
  validate :team_needed?

  def team_needed?
    if self.role == :std
      self.errors.add('User must select a team.')
    end
  end
end
