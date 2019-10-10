# frozen_string_literal: true

##
# Relation between players and teams
#
class Player < ApplicationRecord
  #
  # Associations
  #

  belongs_to :team, optional: true

  #
  # Validations
  #

  validates :name, presence: true
  before_save :manage_players_on_team

  #
  # Enumerators
  #

  enum positions: %i[QB RB WR TE K DST]

  ##
  # Teams should have 53 player at maximun.
  #

  def manage_players_on_team
    errors.add(:team, 'This team has 53 players.') if team.players.count >= 53
  end
end
