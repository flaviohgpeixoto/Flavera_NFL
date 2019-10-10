# frozen_string_literal: true

##
# Model Player
#
class Player < ApplicationRecord
  ##
  # Setting relations between models
  #
  belongs_to :team, optional: true

  ##
  # Validates - name - mandatory
  #
  validates :name, presence: true

  ##
  # Offence positions, kicker and defense - Standard fantasy league positions
  #
  enum positions: %i[QB RB WR TE K DST]

  ##
  # Verifying numbers of player on a team
  #
  before_save :manage_players_on_team

  def manage_players_on_team
    self.errors.add :team, 'This team has 53 players.' if team&.players&.count >= 53
  end
end
