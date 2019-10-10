# frozen_string_literal: true

##
# Model League
#
class League < ApplicationRecord
  ##
  # Setting relations between models
  #
  has_many :tripples
  has_many :teams, through: :tripples
  has_many :users, through: :tripples

  ##
  # Validates - name - mandatory and unique
  #
  validates :name, presence: true, uniqueness: true

  ##
  # Verifying numbers of team in a league
  #
  validate :check_teams_on_league, on: :update

  def check_teams_on_league
    self.errors.add :teams, message: 'League must have 32 teams!' if teams.count != 32
  end
end
