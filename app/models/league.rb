# frozen_string_literal: true

##
# Relation between users, tripples and teams
#
class League < ApplicationRecord
  #
  # Associations
  #

  has_many :tripples
  has_many :teams, through: :tripples
  has_many :users, through: :tripples

  #
  # Validations
  #

  validates :name, presence: true, uniqueness: true
  validate :check_teams_on_league, on: :update

  ##
  # Leagues should have 32 teams before start.
  #

  def check_teams_on_league
    errors.add :teams, message: 'League must have 32 teams!' if teams.count != 32
  end
end
